
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterIngredientItem extends StatelessWidget {
  const EnterIngredientItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.drag_indicator,
          color: context.secondaryTextColor,
          size: 24,
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: CustomTextFormField(
            hint: AppLocalizationKeys.upload.enterIngredient.tr(),
          ),
        ),
      ],
    );
  }
}
