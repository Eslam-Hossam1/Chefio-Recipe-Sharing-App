
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FoodNameAndDescriptionSection extends StatelessWidget {
  const FoodNameAndDescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizationKeys.upload.foodName.tr(),
            style: Styles.textStyleBold17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hint: AppLocalizationKeys.upload.enterFoodName.tr(),
          ),
           SizedBox(
            height: 24,
          ),
          Text(
            AppLocalizationKeys.upload.description.tr(),
            style: Styles.textStyleBold17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hint: AppLocalizationKeys.upload.descriptionHint.tr(),
            borderRadius: 8,
            maxLines:   4,
          ),
        ],
      ),
    );
  }
}
