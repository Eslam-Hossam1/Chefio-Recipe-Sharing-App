import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/custom_bold_17_title.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/widgets/recipe_details_custom_divider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeDescription extends StatelessWidget {
  const RecipeDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecipeDetailsCustomDivider(),
        CustomBold17Title(
          text: AppLocalizationKeys.upload.description.tr(),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
          style: Styles.textStyleMedium15(context).copyWith(
            color: context.secondaryTextColor,
          ),
        ),
               RecipeDetailsCustomDivider(),

      ],
    );
  }
}
