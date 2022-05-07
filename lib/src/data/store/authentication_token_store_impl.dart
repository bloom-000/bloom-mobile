import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../domain/store/authentication_token_store.dart';

@LazySingleton(as: AuthenticationTokenStore)
class AuthenticationTokenStoreImpl implements AuthenticationTokenStore {
  AuthenticationTokenStoreImpl(
    this._secureStorage,
  );

  final FlutterSecureStorage _secureStorage;

  static const String _keyAccessToken = 'key_access_token';
  static const String _keyRefreshToken = 'key_refresh_token';

  @override
  Future<void> clear() async {
    _secureStorage.delete(key: _keyAccessToken);
    _secureStorage.delete(key: _keyRefreshToken);
  }

  @override
  Future<String?> readAccessToken() => _secureStorage.read(key: _keyAccessToken);

  @override
  Future<String?> readRefreshToken() => _secureStorage.read(key: _keyRefreshToken);

  @override
  Future<void> writeAccessToken(String accessToken) async =>
      _secureStorage.write(key: _keyAccessToken, value: accessToken);

  @override
  Future<void> writeRefreshToken(String refreshToken) =>
      _secureStorage.write(key: _keyRefreshToken, value: refreshToken);

  @override
  Future<bool> hasRefreshToken() async {
    final refreshToken = await _secureStorage.read(key: _keyRefreshToken);
    return refreshToken != null;
  }
}
