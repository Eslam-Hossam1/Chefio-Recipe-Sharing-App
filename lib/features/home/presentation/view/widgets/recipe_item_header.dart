
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:flutter/material.dart';

class RecipeItemHeader extends StatelessWidget {
  const RecipeItemHeader({
    super.key,
  });

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
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(Assets.imagesUserOneTest))),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          'Eslam Hossam',
          style: Styles.textStyleMedium12(context)
              .copyWith(color: context.mainTextColor),
        ),
      ],
    );
  }
}
