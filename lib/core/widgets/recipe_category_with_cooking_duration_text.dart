import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecipeCategoryWithCookingDurationText extends StatelessWidget {
  const RecipeCategoryWithCookingDurationText({
    super.key,
    required this.categoryName,
    required this.cookingDuration,
  });

  final String categoryName;
  final String cookingDuration;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            "$categoryName $cookingDuration ${AppLocalizationKeys.global.mins.tr()}",
            style: Styles.textStyleMedium12(context)
                .copyWith(color: context.secondaryTextColor),
          ),
        ),
      ],
    );
  }
}
