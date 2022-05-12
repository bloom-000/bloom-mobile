import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/category/category.dart';
import '../../domain/repository/category_repository.dart';
import '../network/mapper/category/category_mapper.dart';
import '../network/remote_service/category_remote_service.dart';
import '../network/schema/category/category_schema.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(
    this._categoryRemoteService,
    this._categoryMapper,
  );

  final CategoryRemoteService _categoryRemoteService;
  final CategoryMapper _categoryMapper;

  @override
  Future<Either<FetchFailure, List<Category>>> getAllCategories() async {
    final Either<FetchFailure, List<CategorySchema>> result =
        await _categoryRemoteService.getAllCategories();

    return result.map((List<CategorySchema> r) => r.map(_categoryMapper.mapToRight).toList());
  }
}
