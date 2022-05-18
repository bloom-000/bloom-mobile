import 'package:common_models/common_models.dart';
import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants.dart';
import '../../../../domain/model/product/product.dart';
import '../../../widgets/default_back_button.dart';
import '../state/product_page_product_cubit.dart';

class TopBar implements SliverPersistentHeaderDelegate {
  const TopBar({
    required this.minExtent,
    required this.maxExtent,
  });

  @override
  final double minExtent;

  @override
  final double maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double offset = shrinkOffset / maxExtent;
    final ThemeData theme = Theme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          foregroundDecoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.black12, Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: <double>[0, .2],
            ),
          ),
          child: BlocBuilder<ProductPageProductCubit, DataState<FetchFailure, Product>>(
            builder: (_, DataState<FetchFailure, Product> state) {
              return SafeImage(
                url: state.maybeWhen(
                  success: (Product data) => '${Constants.apiUrl}/${data.primaryImagePath}',
                  orElse: () => null,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 54,
            width: maxExtent,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor.withOpacity(offset > .8 ? 1 : 0),
            ),
          ),
        ),
        const Positioned(
          left: 0,
          child: ClipOval(
            child: Material(
              type: MaterialType.transparency,
              child: DefaultBackButton(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate delegate) => true;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => FloatingHeaderSnapConfiguration();

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
