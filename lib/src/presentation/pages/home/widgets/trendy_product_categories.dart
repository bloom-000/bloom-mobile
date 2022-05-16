import 'package:common_models/common_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:static_i18n/static_i18n.dart';

import '../../../../domain/model/category/category.dart';
import '../../../i18n/translation_keys.dart';
import '../state/home_page_categories_cubit.dart';

class TrendyProductCategories extends StatelessWidget {
  const TrendyProductCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<HomePageCategoriesCubit, DataState<FetchFailure, List<Category>>>(
      builder: (_, DataState<FetchFailure, List<Category>> state) {
        return state.maybeWhen(
          success: (List<Category> data) {
            final List<Widget> tabs = data
                .map(
                  (Category e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(e.id != null ? e.name : TkCommon.all.i18n),
                  ),
                )
                .toList();

            return SizedBox(
              height: 24,
              child: DefaultTabController(
                length: data.length,
                child: TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  onTap: (int index) =>
                      context.read<HomePageCategoriesCubit>().onCategoryChanged(data[index]),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                  labelColor: theme.textTheme.bodyText1?.color,
                  isScrollable: true,
                  tabs: tabs,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicator: BoxDecoration(
                    border: Border.all(color: theme.primaryColor),
                  ),
                ),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
