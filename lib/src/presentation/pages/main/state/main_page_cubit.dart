import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_page_cubit.freezed.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState({
    required int pageIndex,
  }) = _MainPageState;

  factory MainPageState.initial() => const MainPageState(
        pageIndex: 0,
      );
}

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState.initial());

  void onBottomNavItemPressed(int index) => emit(state.copyWith(pageIndex: index.clamp(0, 3)));
}
