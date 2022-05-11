import 'package:common_models/common_models.dart';

import '../model/category/category.dart';

abstract class CategoryRepository {
  Future<Either<FetchFailure, List<Category>>> getAllCategories();
}
