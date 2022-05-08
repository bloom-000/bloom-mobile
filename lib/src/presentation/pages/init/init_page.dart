import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection_config.dart';
import 'state/init_page_cubit.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitPageCubit>(
      create: (_) => getIt<InitPageCubit>()..init(),
      lazy: false,
      child: const Scaffold(),
    );
  }
}
