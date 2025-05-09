import 'package:chefio_app/features/profile/presentation/manager/chef_liked_recipes_cubit/chef_liked_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/chef_liked_recipes_scrolling_loading_indicator_builder.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_liked_recipes_grid.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_separator_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileLikedRecipesSection extends StatefulWidget {
  const ProfileLikedRecipesSection({
    super.key,
  });

  @override
  State<ProfileLikedRecipesSection> createState() =>
      _ProfileLikedRecipesSectionState();
}

class _ProfileLikedRecipesSectionState
    extends State<ProfileLikedRecipesSection> {
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
      context.read<ChefLikedRecipesCubit>().fetchChefLikedRecipes(
            chefId: context.read<ProfileCubit>().chefId,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: ProfileSeparatorSizedBox()),
        ProfileLikedRecipesGrid(
          recipes: context.read<ChefLikedRecipesCubit>().chefLikedRecipes,
        ),
        ChefLikedRecipesScrollingLoadingIndicatorbuilder(),
      ],
    );
  }
}
