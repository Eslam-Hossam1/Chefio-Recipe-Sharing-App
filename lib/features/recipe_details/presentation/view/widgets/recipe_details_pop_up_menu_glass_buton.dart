import 'package:chefio_app/core/models/pop_up_menu_model.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/routing/routing_helper.dart';
import 'package:chefio_app/core/theme/app_colors.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/build_pop_up_menu_item.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_actions_cubit/recipe_details_actions_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_circle_glass_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditAndSharePopUpMenuGlassButton extends StatelessWidget {
  const EditAndSharePopUpMenuGlassButton({
    super.key,
  });
  static final List<PopUpMenuModel> popUpModels = [
    PopUpMenuModel(
      iconData: Icons.share,
      textLocalizationKey: AppLocalizationKeys.recipeDetails.shareRecipe,
      onTap: (context) async {
        await context.read<RecipeDetailsActionsCubit>().shareRecipe(
              recipeId:
                  context.read<RecipeDetailsCubit>().recipeDetailModel!.id,
            );
      },
    ),
    PopUpMenuModel(
      iconData: Icons.edit,
      textLocalizationKey: AppLocalizationKeys.recipeDetails.editRecipe,
      onTap: (context) {
        RoutingHelper.pushEditRecipe(
          context,
          recipeDetailsModel:
              context.read<RecipeDetailsCubit>().recipeDetailModel!,
        );
      },
    ),
    PopUpMenuModel(
      iconData: Icons.delete,
      color: AppColors.logoutText,
      textLocalizationKey: AppLocalizationKeys.global.deleteRecipe,
      onTap: (context) {
        DialogHelper.showWarningDialog(
          context,
          errorMessage:
              AppLocalizationKeys.global.deleteRecipeConfirmation.tr(),
          btnOkOnPress: () {
            context.read<RecipeDetailsCubit>().deleteRecipe(
                  recipeId:
                      context.read<RecipeDetailsCubit>().recipeDetailModel!.id,
                );
          },
        );
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: context.dialogBackgroundColor,
      child: CustomCircleGlassButton(
        child: Icon(
          FontAwesomeIcons.ellipsisVertical,
          color: Colors.white,
        ),
      ),
      itemBuilder: (context) => List.generate(
        popUpModels.length,
        (index) => buildPopUpMenuItem(
          context,
          popUpMenuModel: popUpModels[index],
        ),
      ),
    );
  }
}
