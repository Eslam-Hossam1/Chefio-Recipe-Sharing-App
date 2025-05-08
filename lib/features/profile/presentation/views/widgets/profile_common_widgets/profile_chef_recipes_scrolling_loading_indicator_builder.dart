import 'package:chefio_app/features/home/presentation/view/widgets/sliver_scrolling_loading_indicator.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileChefRecipesScrollingLoadingIndicatorbuilder extends StatelessWidget {
  const ProfileChefRecipesScrollingLoadingIndicatorbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChefProfileRecipesCubit, ChefProfileRecipesState>(
      builder: (context, state) {
        return state is FetchMoreChefRecipes
            ? SliverScrollingLoadingIndIcator()
            : SliverToBoxAdapter(
                child: SizedBox.shrink(),
              );
      },
    );
  }
}
