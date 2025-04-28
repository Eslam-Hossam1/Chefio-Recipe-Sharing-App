import 'dart:developer';

import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_actions_cubit/recipe_details_actions_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_circle_glass_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class EditAndSharePopUpMenuButton extends StatelessWidget {
  const EditAndSharePopUpMenuButton({
    super.key,
  });

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
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.share, color: context.mainTextColor),
                Text(
                  AppLocalizationKeys.recipeDetails.shareRecipe.tr(),
                  style: Styles.textStyleMedium15(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ],
            ),
            onTap: () async {
              await context.read<RecipeDetailsActionsCubit>().shareRecipe(
                    recipeId: context
                        .read<RecipeDetailsCubit>()
                        .recipeDetailModel!
                        .id,
                  );
            },
          ),
          PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.edit, color: context.mainTextColor),
                  Text(
                    AppLocalizationKeys.recipeDetails.editRecipe.tr(),
                    style: Styles.textStyleMedium15(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  ),
                ],
              ),
              onTap: () {
                context.push(
                  RoutePaths.upload,
                  extra: context.read<RecipeDetailsCubit>().recipeDetailModel,
                );
              }),
        ];
      },
    );
  }
}
