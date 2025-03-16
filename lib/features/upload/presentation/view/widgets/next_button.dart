
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: CustomTextButton(
          width: double.infinity,
          child: Text(
            AppLocalizationKeys.global.next.tr(),
            style: Styles.textStyleBold15(context)
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
