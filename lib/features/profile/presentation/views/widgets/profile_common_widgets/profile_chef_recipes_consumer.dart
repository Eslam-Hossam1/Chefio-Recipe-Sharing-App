import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/widgets/custom_info_message_with_button.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_info_message.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_recipes_grid.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/skeletonizer_profile_chef_recipes_grid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileChefRecipesConsumer extends StatelessWidget {
  const ProfileChefRecipesConsumer({
    super.key,
    required this.chefId,
  });
  final String chefId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChefProfileRecipesCubit, ChefProfileRecipesState>(
      listener: (context, state) {
        if (state is FetchMoreRecipesFailure) {
          showCustomToast(
            context,
            message: state.errLocalizationKey.tr(),
          );
        }
      },
      builder: (context, state) {
        if (state is RecipesInitialFetchFailure) {
          return SliverToBoxAdapter(
            child: CustomInfoMessageWithButton(
              message: state.errLocalizationKey.tr(),
              onPressed: () {
                context.read<ChefProfileRecipesCubit>().fetchChefRecipes(
                      chefId: chefId,
                    );
              },
            ),
          );
        } else if (state is ChefProfileRecipesInitial) {
          return SkeletonizerProfileChefRecipesGrid();
        } else if (state is MyProfileEmptyRecipes) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CustomInfoMessageWithButton(
                message:AppLocalizationKeys.profile.myProfileNoRecipesMessage.tr(),
                btnText: AppLocalizationKeys.profile.addRecipe.tr(),
                onPressed: () {
                  context.push(RoutePaths.upload);
                },
              ),
            ),
          );
        } else if (state is EmptyChefRecipes) {
          return SliverToBoxAdapter(
            child: CustomTextInfoMessage(
              text: AppLocalizationKeys.profile.chefNoRecipes.tr(),
            ),
          );
        } else {
          return ProfileChefRecipesGrid(
            recipes: context.read<ChefProfileRecipesCubit>().chefRecipes,
          );
        }
      },
    );
  }
}
