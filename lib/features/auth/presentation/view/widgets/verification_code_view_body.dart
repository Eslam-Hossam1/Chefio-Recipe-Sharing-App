import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_pin_code_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerificationCodeViewBody extends StatelessWidget {
  const VerificationCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            // Expanded(
            //     child: SizedBox(
            //   height: 40,
            // )),
            Text(
              AppLocalizationKeys.auth.verificationCodeViewCheckYourEmail.tr(),
              style: Styles.textStyleBold22(context).copyWith(
                color: AppColors.getMainTextColor(context),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizationKeys.auth.verificationCodeViewCheckYourEmail.tr(),
              style: Styles.textStyleMedium15(context).copyWith(
                color: AppColors.getSecondaryTextColor(context),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            CustomPinCodeField(),
          ],
        ),
      ),
    ]);
  }
}
