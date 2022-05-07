import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.apiUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
}
