import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../navigation/page_navigator.dart';

part 'welcome_page_cubit.freezed.dart';

@freezed
class WelcomePageState with _$WelcomePageState {
  const factory WelcomePageState({
    required int pageIndex,
  }) = _WelcomePageState;

  factory WelcomePageState.initial() => const WelcomePageState(
        pageIndex: 0,
      );
}

@injectable
class WelcomePageCubit extends Cubit<WelcomePageState> {
  WelcomePageCubit(
    this._pageNavigator,
  ) : super(WelcomePageState.initial());

  final PageNavigator _pageNavigator;

  final PageController pageController = PageController();

  void init() {
    pageController.addListener(
        () => emit(state.copyWith(pageIndex: pageController.page?.round().clamp(0, 4) ?? 0)));
  }

  void onSignInPressed() => _pageNavigator.toSignInPage();

  void onCreateAccountPressed() => _pageNavigator.toSignUpPage();

  @override
  Future<void> close() {
    pageController.dispose();

    return super.close();
  }
}
