import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomePageCubit extends Cubit<Unit> {
  HomePageCubit() : super(unit);

  void onPackagePressed() {}

  void onSearchPressed() {}
}
