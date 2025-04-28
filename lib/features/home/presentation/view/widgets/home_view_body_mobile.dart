import 'dart:developer';

import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/presentation/manager/home_categories_cubit/home_categories_cubit.dart';
import 'package:chefio_app/features/home/presentation/manager/home_recipes_cubit/home_recipes_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_categories_builder.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_scrolling_loading_indicator_builder.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_sliver_app_bar.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipes_grid_home_builder.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/search_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeViewBodyMobile extends StatefulWidget {
  const HomeViewBodyMobile({super.key});

  @override
  State<HomeViewBodyMobile> createState() => _HomeViewBodyMobileState();
}

class _HomeViewBodyMobileState extends State<HomeViewBodyMobile> {
  late ScrollController _scrollController;
  late RefreshController _refreshController;

  Future<void> _onRefresh() async {
    await Future.wait([
      context.read<HomeCategoriesCubit>().refreshCategories(),
      context.read<HomeRecipesCubit>().refreshRecipes(),
    ]);
    _refreshController.refreshCompleted(); // Stop refresh indicator
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _refreshController = RefreshController();
    context.read<HomeCategoriesCubit>().fetchCategories();
    context.read<HomeRecipesCubit>().fetchRecipes();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<HomeRecipesCubit>().fetchRecipes();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: _onRefresh,
      controller: _refreshController,
      header: ClassicHeader(),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          HomeSliverAppBar(
            searchWidget: SearchIconButton(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: HomeCategoriesBuilder(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: (48 *
                      (MediaQuery.sizeOf(context).width /
                          Constants.kDesignWidth))
                  .clamp(48, 80),
              thickness: 8,
              color: context.formColor,
            ),
          ),
          SliverAdaptivePadding(sliver: RecipesGridHomeBuilder()),
          HomeScrollingLoadingIndicatorbuilder(),
        ],
      ),
    );
  }
}
