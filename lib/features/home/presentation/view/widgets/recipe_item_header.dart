import 'package:cached_network_image/cached_network_image.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/home/data/models/recipe_model/recipe_model.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class RecipeItemHeader extends StatelessWidget {
  const RecipeItemHeader({
    super.key,
    required this.recipeModel,
  });
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 40),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedNetworkImage(
                  url: recipeModel.thumbnail ??
                      "https://cdn.dummyjson.com/products/images/furniture/Annibale%20Colombo%20Bed/thumbnail.png",
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            recipeModel.title ?? "null",
            style: Styles.textStyleMedium12(context)
                .copyWith(color: context.mainTextColor),
          ),
        ),
      ],
    );
  }
}
