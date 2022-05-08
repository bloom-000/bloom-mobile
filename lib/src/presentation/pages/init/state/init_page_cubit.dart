import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/manager/authentication_manager.dart';
import '../../../navigation/page_navigator.dart';

@injectable
class InitPageCubit extends Cubit<Unit> {
  InitPageCubit(
    this._authenticationManager,
    this._pageNavigator,
  ) : super(unit);

  final AuthenticationManager _authenticationManager;
  final PageNavigator _pageNavigator;

  Future<void> init() async {
    final bool isAuthenticated = await _authenticationManager.isAuthenticated();
    if (isAuthenticated) {
      _pageNavigator.toMainPage();
    } else {
      _pageNavigator.toWelcomePage();
    }
  }
}
