import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppLocalizationKeys.auth.forgetPasswordViewPasswordRecovery
                      .tr(),
                  style: Styles.textStyleBold22(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  textAlign: TextAlign.center,
                  AppLocalizationKeys
                      .auth.forgetPasswordViewEnterEmailRecoverPassword
                      .tr(),
                  style: Styles.textStyleMedium15(context).copyWith(
                    color: context.secondaryTextColor,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                const ForgotPasswordForm(),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
