import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/otp/presentation/view/widgets/otp_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            Expanded(
                child: SizedBox(
              height: 20,
            )),
            Text(
              AppLocalizationKeys.auth.verificationCodeViewCheckYourEmail.tr(),
              style: Styles.textStyleBold22(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              AppLocalizationKeys.auth.verificationCodeViewWeHaveSent.tr(),
              style: Styles.textStyleMedium15(context).copyWith(
                color: context.secondaryTextColor,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            OtpForm(),
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: 20,
                )),
          ],
        ),
      ),
    ]);
  }
}
