import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_text_info_message.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_likers_cubit/recipe_likers_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_likers_list_view.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/skeletonizer_recipe_likers_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeLikersBottomSheetBodyBuilder extends StatelessWidget {
  const RecipeLikersBottomSheetBodyBuilder({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeLikersCubit, RecipeLikersState>(
      builder: (context, state) {
        if (state is RecipeLikersFailure) {
          return CustomTextInfoMessage(
            text: state.errorLocalizationKey.tr(),
          );
        } else if (state is RecipeLikersSuccess) {
          return RecipeLikersListView(
            scrollController: scrollController,
            recipeLikers: state.recipeLikers,
          );
        } else if (state is EmptyRecipeLikers) {
          return CustomTextInfoMessage(
            text: AppLocalizationKeys.recipeDetails.recipeNoLikesMessage.tr(),
          );
        } else {
          return SkeletonizerRecipeLikersListView(
            scrollController: scrollController,
          );
        }
      },
    );
  }
}
