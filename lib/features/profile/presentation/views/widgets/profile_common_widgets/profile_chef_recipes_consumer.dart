import 'package:chefio_app/core/Functions/show_custom_toast.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_error_message.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_profile_recipes_cubit/chef_profile_recipes_cubit.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_recipes_grid.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/skeletonizer_profile_chef_recipes_grid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileChefRecipesConsumer extends StatelessWidget {
  const ProfileChefRecipesConsumer({
    super.key,
  });

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
          return CustomTextErrorMessage(
            text: state.errLocalizationKey.tr(),
          );
        } else if (state is ChefProfileRecipesInitial) {
          return SkeletonizerProfileChefRecipesGrid();
        } else {
          return ProfileChefRecipesGrid(
            recipes: context.read<ChefProfileRecipesCubit>().chefRecipes,
          );
        }
      },
    );
  }
}
