
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_scrolling_loading_indicator.dart';
import 'package:chefio_app/features/search/presentation/manager/search_recipe_cubit/search_recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScrollingLoadingIndicatorBuilder extends StatelessWidget {
  const SearchScrollingLoadingIndicatorBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
          builder: (context, state) {
    return state is LoadingMore
        ? SliverScrollingLoadingIndIcator()
        : SliverToBoxAdapter(
            child: SizedBox.shrink(),
          );
          },
        );
  }
}
