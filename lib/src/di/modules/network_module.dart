import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../main.dart';
import '../../common/constants.dart';
import '../../data/network/api/api_service.dart';
import '../../data/network/interceptor/authorization_interceptor.dart';
import '../../data/network/interceptor/pretty_log_interceptor.dart';
import '../../domain/store/authentication_token_store.dart';
import '../../presentation/navigation/page_navigator.dart';

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
    dio.interceptors.add(PrettyLogInterceptor(logPrint: logger.d));

    return dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);
}
