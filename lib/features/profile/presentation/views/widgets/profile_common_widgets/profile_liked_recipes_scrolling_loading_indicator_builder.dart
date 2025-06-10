import 'package:chefio_app/features/home/presentation/view/widgets/sliver_scrolling_loading_indicator.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_liked_recipes_cubit/chef_liked_recipes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileLikedRecipesScrollingLoadingIndicatorbuilder
    extends StatelessWidget {
  const ProfileLikedRecipesScrollingLoadingIndicatorbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefLikedRecipesCubit, ChefLikedRecipesState>(
      builder: (context, state) {
        if (state is FetchMoreLikedRecipes) {
          return SliverScrollingLoadingIndIcator();
        } else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
