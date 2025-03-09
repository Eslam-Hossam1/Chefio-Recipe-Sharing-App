import 'dart:developer';

import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_sliver_app_bar.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipes_grid.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/search_icon_button.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/search_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';

class HomeViewBodyTablet extends StatelessWidget {
  const HomeViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeSliverAppBar(
          searchWidget: SearchTextButton(),
        ),
        SliverToBoxAdapter(
          child: CategoriesListView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 48,
            thickness: 8,
            color: context.formColor,
          ),
        ),
        SliverAdaptivePadding(sliver: RecipesGrid()),
      ],
    );
  }
}
