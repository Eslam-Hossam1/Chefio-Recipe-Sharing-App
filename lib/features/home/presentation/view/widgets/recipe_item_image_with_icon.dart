import 'dart:developer';
import 'dart:ui';

import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/favourite_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RecipeItemImageWithIcon extends StatelessWidget {
  const RecipeItemImageWithIcon({
    super.key,
    required this.recipeModel,
  });
  final Recipe recipeModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CustomCachedNetworkImage(
                url: recipeModel.recipePicture ??
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/375px-Pizza-3007395.jpg",
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: context.locale == Constants.arabicLocale ? null : 16,
            left: context.locale == Constants.arabicLocale ? 16 : null,
            child: FavouriteIconButton(
              recipeModel: recipeModel,
            ),
          )
        ],
      ),
    );
  }
}
