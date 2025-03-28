import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_circle_glass_button.dart';
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
                Text(
                  "Share Recipe",
                  style: Styles.textStyleMedium15(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
                Icon(Icons.share, color: context.mainTextColor)
              ],
            ),
            onTap: () {},
          ),
          PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Edit Recipe",
                    style: Styles.textStyleMedium15(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  ),
                  Icon(Icons.edit, color: context.mainTextColor)
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
