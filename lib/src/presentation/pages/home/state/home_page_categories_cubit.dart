import 'package:common_models/common_models.dart';
import 'package:common_utilities/common_utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/category/category.dart';
import '../../../../domain/repository/category_repository.dart';
import '../../../events/event_product.dart';

@injectable
class HomePageCategoriesCubit extends Cubit<DataState<FetchFailure, List<Category>>> {
  HomePageCategoriesCubit(
    this._categoryRepository,
    this._eventBus,
  ) : super(DataState<FetchFailure, List<Category>>.idle());

  final CategoryRepository _categoryRepository;
  final EventBus _eventBus;

  void init() => _fetchCategories();

  Future<void> _fetchCategories() async {
    emit(DataState<FetchFailure, List<Category>>.loading());

    final Either<FetchFailure, List<Category>> result = await _categoryRepository
        .getAllCategories()
        .then((Either<FetchFailure, List<Category>> value) => value.map((List<Category> r) =>
            r..insert(0, const Category(id: null, name: '', description: ''))));

    emit(DataState<FetchFailure, List<Category>>.fromEither(result));
  }

  void onCategoryChanged(Category category) =>
      _eventBus.fire(EventProduct.trendyProductsCategoryChanged(category));
}
