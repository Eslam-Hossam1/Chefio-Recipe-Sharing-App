
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterStepItem extends StatelessWidget {
  const EnterStepItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: context.mainTextColor,
              child: Text(
                '1',
                style: Styles.textStyleBold12(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Icon(
              Icons.drag_indicator,
              color: context.secondaryTextColor,
              size: 24,
            ),
          ],
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: CustomTextFormField(
            hint: AppLocalizationKeys.upload.stepHint.tr(),
            borderRadius: 8,
            maxLines: 4,
          ),
        ),
      ],
    );
  }
}
