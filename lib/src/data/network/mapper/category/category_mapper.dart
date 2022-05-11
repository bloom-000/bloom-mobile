import 'package:common_models/common_models.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/category/category.dart';
import '../../schema/category/category_schema.dart';

@lazySingleton
class CategoryMapper extends BaseMapper<CategorySchema, Category> {
  @override
  Category mapToRight(CategorySchema l) {
    return Category(
      id: l.id ?? '',
      name: l.name ?? '',
      description: l.description,
    );
  }
}
