import 'package:chefio_app/features/home/presentation/view/widgets/sliver_scrolling_loading_indicator.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_liked_recipes_cubit/chef_liked_recipes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefLikedRecipesScrollingLoadingIndicatorbuilder extends StatelessWidget {
  const ChefLikedRecipesScrollingLoadingIndicatorbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefLikedRecipesCubit, ChefLikedRecipesState>(
      builder: (context, state) {
        return state is FetchMoreLikedRecipes
            ? SliverScrollingLoadingIndIcator()
            : SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
      },
    );
  }
}
