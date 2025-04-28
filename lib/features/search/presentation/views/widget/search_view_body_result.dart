import 'dart:developer';

import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_recipes_grid.dart';
import 'package:chefio_app/features/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_app_bar.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_scrolling_loading_indicator_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBodyResult extends StatefulWidget {
  const SearchViewBodyResult({super.key});

  @override
  State<SearchViewBodyResult> createState() => _SearchViewBodyResultState();
}

class _SearchViewBodyResultState extends State<SearchViewBodyResult> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<SearchRecipeCubit>().fetchMoreRecipes();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SearchAppBar(),
        SliverToBoxAdapter(
          child: Divider(
            height: 48,
            thickness: 8,
            color: context.formColor,
          ),
        ),
        SliverAdaptivePadding(
          sliver: SliverRecipesGrid(
              recipes: context.read<SearchRecipeCubit>().recipes),
        ),
        SearchScrollingLoadingIndicatorBuilder()
      ],
    );
  }
}
