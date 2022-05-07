import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../common/constants.dart';
import '../../data/network/api/api_service.dart';
import '../../data/network/api/multipart_api_service.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    final Dio dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        connectTimeout: 20000,
        sendTimeout: 20000,
      ),
    );

    return dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);

  @lazySingleton
  MultipartApiService multipartApiService(Dio dio) => MultipartApiService(dio, Constants.apiUrl);
}
