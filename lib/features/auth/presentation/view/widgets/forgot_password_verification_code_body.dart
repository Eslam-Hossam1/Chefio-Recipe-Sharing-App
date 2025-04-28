import 'package:chefio_app/core/Functions/get_auth_padding.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/code_expires_in.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_pin_code_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_verification_code_form.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/send_again_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verification_code_form.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verifiy_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgotPasswordVerificationCodeViewBody extends StatelessWidget {
  const ForgotPasswordVerificationCodeViewBody({super.key});

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
            ForgotPasswordVerificationCodeForm(),
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
