import 'dart:developer';
import 'dart:io';

import 'package:common_network_components/common_network_components.dart';
import 'package:dio/dio.dart';
import 'package:synchronized/extension.dart';

import '../../../domain/store/authentication_token_store.dart';
import '../../../presentation/navigation/page_navigator.dart';
import '../schema/authentication/authentication_payload_schema.dart';

const int kNetworkTimeout = 20000;

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor(
    this._authenticationTokenStore,
    this._dio,
    this._pageNavigator,
    this._baseUrl,
  );

  final AuthenticationTokenStore _authenticationTokenStore;
  final Dio _dio;
  final PageNavigator _pageNavigator;
  final String _baseUrl;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = await _authenticationTokenStore.readAccessToken();

    if (accessToken != null) {
      if (JwtDecoder.isExpired(accessToken)) {
        await synchronized(() => _tryRefreshAccessToken());
        accessToken = await _authenticationTokenStore.readAccessToken();
      }
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }

  Future<void> _tryRefreshAccessToken() async {
    final String? refreshToken = await _authenticationTokenStore.readRefreshToken();
    if (refreshToken != null) {
      if (JwtDecoder.isExpired(refreshToken)) {
        await _clearExit();
      } else {
        await _refreshAccessToken(refreshToken);
      }
    }
  }

  Future<void> _refreshAccessToken(String refreshToken) async {
    try {
      final Response<dynamic> response = await _dio.post(
        '$_baseUrl/authentication/refresh',
        data: <String, String>{'refreshToken': refreshToken},
      );
      final AuthenticationPayloadSchema payloadSchema =
          AuthenticationPayloadSchema.fromJson(response.data as Map<String, dynamic>);
      if (payloadSchema.refreshToken == null || payloadSchema.accessToken == null) {
        await _clearExit();
      } else {
        await _authenticationTokenStore.writeAccessToken(payloadSchema.accessToken!);
        await _authenticationTokenStore.writeRefreshToken(payloadSchema.refreshToken!);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        await _clearExit();
      }
      log('TokenHeaderInterceptor._refreshAccessToken: ', error: e);
    }
  }

  Future<void> _clearExit() async {
    await _authenticationTokenStore.clear();
    _pageNavigator.toWelcomePage();
  }
}
