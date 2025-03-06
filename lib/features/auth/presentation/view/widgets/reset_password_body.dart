import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/clickable_text.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/reset_password_form.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                AppLocalizationKeys.auth.resetPasswordViewResetYourPassword
                    .tr(),
                style: Styles.textStyleBold22(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                textAlign: TextAlign.center,
                AppLocalizationKeys.auth.resetPasswordViewPleaseEnterNewPassword
                    .tr(),
                style: Styles.textStyleMedium15(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const ResetPasswordForm(),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                flex: 2,
                child: const SizedBox(
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
