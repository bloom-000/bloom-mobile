import 'package:common_models/common_models.dart';
import 'package:common_network_components/common_network_components.dart';
import 'package:injectable/injectable.dart';

import '../api/api_service.dart';
import '../schema/category/category_schema.dart';

@lazySingleton
class CategoryRemoteService extends BaseService {
  CategoryRemoteService(
    this._apiService,
  );

  final ApiService _apiService;

  Future<Either<FetchFailure, List<CategorySchema>>> getAllCategories() async =>
      safeFetch(() => _apiService.getAllCategories());
}
