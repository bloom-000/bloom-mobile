import 'package:injectable/injectable.dart';

import '../../domain/manager/authentication_manager.dart';
import '../../domain/store/authentication_token_store.dart';

@LazySingleton(as: AuthenticationManager)
class AuthenticationManagerImpl implements AuthenticationManager {
  AuthenticationManagerImpl(
    this._authenticationTokenStore,
  );

  final AuthenticationTokenStore _authenticationTokenStore;

  @override
  Future<bool> isAuthenticated() => _authenticationTokenStore.hasRefreshToken();
}
