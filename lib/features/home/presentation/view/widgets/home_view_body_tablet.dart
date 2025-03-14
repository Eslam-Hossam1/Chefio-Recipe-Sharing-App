import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/sliver_adaptive_padding.dart';
import 'package:chefio_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_and_divider_section.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/categories_listview.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_scrolling_loading_indicator_builder.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/home_sliver_app_bar.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipes_grid_home_builder.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/search_icon_button.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/search_text_button.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_scrolling_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeViewBodyTablet extends StatefulWidget {
  const HomeViewBodyTablet({super.key});

  @override
  State<HomeViewBodyTablet> createState() => _HomeViewBodyTabletState();
}

class _HomeViewBodyTabletState extends State<HomeViewBodyTablet> {
  late ScrollController _scrollController;
  late RefreshController _refreshController;

  Future<void> _onRefresh() async {
    await context.read<HomeCubit>().refresh();
    _refreshController.refreshCompleted(); // Stop refresh indicator
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _refreshController = RefreshController();
    context.read<HomeCubit>().firstFetchRecipes();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<HomeCubit>().fetchRecipes();
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
            searchWidget: SearchTextButton(),
          ),
          SliverToBoxAdapter(
            child: CategoriesAndDividerSection(),
          ),
          SliverAdaptivePadding(sliver: RecipesGridHomeBuilder()),
          HomeScrollingLoadingIndicatorbuilder(),
        ],
      ),
    );
  }
}
