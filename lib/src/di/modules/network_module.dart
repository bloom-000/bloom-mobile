import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../common/constants.dart';
import '../../data/network/api/api_service.dart';
import '../../data/network/api/multipart_api_service.dart';
import '../../data/network/interceptor/authorization_interceptor.dart';
import '../../domain/store/authentication_token_store.dart';
import '../../presentation/navigation/screen_navigator.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(
    AuthenticationTokenStore authenticationTokenStore,
    PageNavigator pageNavigator,
  ) {
    final Dio dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        connectTimeout: 20000,
        sendTimeout: 20000,
      ),
    );

    dio.interceptors.add(AuthorizationInterceptor(
      authenticationTokenStore,
      Dio(
        BaseOptions(
          contentType: 'application/json',
          connectTimeout: 20000,
          sendTimeout: 20000,
        ),
      ),
      pageNavigator,
      Constants.apiUrl,
    ));

    return dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);

  @lazySingleton
  MultipartApiService multipartApiService(Dio dio) => MultipartApiService(dio, Constants.apiUrl);
}
