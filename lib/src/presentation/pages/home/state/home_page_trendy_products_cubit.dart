import 'dart:async';

import 'package:common_models/common_models.dart';
import 'package:common_utilities/common_utilities.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/bloc/data_pager_with_page_cubit.dart';
import '../../../../domain/model/category/category.dart';
import '../../../../domain/model/product/product.dart';
import '../../../../domain/repository/product_repository.dart';
import '../../../events/event_product.dart';

@injectable
class HomePageTrendyProductsCubit extends DataPagerWithPageCubit<FetchFailure, Product> {
  HomePageTrendyProductsCubit(
    this._productRepository,
    this._eventBus,
  );

  final ProductRepository _productRepository;
  final EventBus _eventBus;

  StreamSubscription<EventProduct>? _eventProductSub;

  Category? _category;

  @override
  Future<void> init([Object? args]) async {
    _eventProductSub = _eventBus.on<EventProduct>().listen((EventProduct event) {
      event.when(trendyProductsCategoryChanged: (Category category) {
        _category = category;
        onRefresh();
      });
    });

    super.init();
  }

  @override
  Future<void> close() async {
    await _eventProductSub?.cancel();

    super.close();
  }

  @override
  Future<Either<FetchFailure, DataPage<Product>>> provideDataPage(int page) async =>
      _productRepository.getProducts(
        page: page,
        categoryIds: _category != null && _category?.id != null ? <String>[_category!.id!] : null,
      );
}
