
import 'package:chefio_app/core/Entities/recipe_body_entity.dart';
import 'package:chefio_app/core/Localization/app_locals.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/favourite_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecipeItemImageWithIcon extends StatelessWidget {
  const RecipeItemImageWithIcon({
    super.key,
    required this.recipeBodyEntity,
  });
  final RecipeBodyEntity recipeBodyEntity;
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
                url: recipeBodyEntity.recipeImageUrl ,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: context.locale == AppLocals.arabic ? null : 16,
            left: context.locale == AppLocals.arabic ? 16 : null,
            child: FavouriteIconButton(
              recipeBodyEntity: recipeBodyEntity,
            ),
          )
        ],
      ),
    );
  }
}
