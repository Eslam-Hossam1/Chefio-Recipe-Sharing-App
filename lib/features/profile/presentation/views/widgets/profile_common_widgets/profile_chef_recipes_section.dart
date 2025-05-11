import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_recipes_grid.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_recipes_scrolling_loading_indicator_builder.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_separator_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileChefRecipesSection extends StatefulWidget {
  const ProfileChefRecipesSection({
    super.key,
  });

  @override
  State<ProfileChefRecipesSection> createState() =>
      _ProfileChefRecipesSectionState();
}

class _ProfileChefRecipesSectionState extends State<ProfileChefRecipesSection>
    with AutomaticKeepAliveClientMixin {
  late ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<ChefProfileRecipesCubit>().fetchChefRecipes(
            chefId: context.read<ProfileCubit>().chefId,
          );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: ProfileSeparatorSizedBox()),
        ProfileChefRecipesGrid(
          recipes: context.read<ChefProfileRecipesCubit>().chefRecipes,
        ),
        ProfileChefRecipesScrollingLoadingIndicatorbuilder()
      ],
    );
  }
}
