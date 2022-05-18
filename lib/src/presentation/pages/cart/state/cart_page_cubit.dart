import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../navigation/page_navigator.dart';

@injectable
class CartPageCubit extends Cubit<Unit> {
  CartPageCubit(
    this._pageNavigator,
  ) : super(unit);

  final PageNavigator _pageNavigator;

  void onCheckoutPressed() {}
}
