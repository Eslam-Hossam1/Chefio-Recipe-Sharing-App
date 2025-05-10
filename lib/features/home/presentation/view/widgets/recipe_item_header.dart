import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeItemHeader extends StatelessWidget {
  const RecipeItemHeader({
    super.key,
    required this.recipeEntity,
  });
  final RecipeEntity recipeEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          RoutingHelper.getProfilePath(
            chefId: recipeEntity.chefId,
          ),
        );
      },
      child: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 40),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedNetworkImage(
                  url: recipeEntity.chefImageUrl ??
                      Constants.nullProfileUserImageUrl,
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
              maxLines: 1,
              recipeEntity.chefUsername,
              style: Styles.textStyleMedium12(context)
                  .copyWith(color: context.mainTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
