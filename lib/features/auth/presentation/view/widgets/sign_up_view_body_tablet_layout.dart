import 'package:chefio_app/core/Functions/get_auth__tablet_padding.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/clickable_text.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBodyTabletLayout extends StatelessWidget {
  const SignUpViewBodyTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getAuthTabletPadding(context)),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 20,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                AppLocalizationKeys.auth.signUpViewWelcome.tr(),
                style: Styles.textStyleBold22(context).copyWith(
                  color: AppColors.getMainTextColor(context),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                textAlign: TextAlign.center,
                AppLocalizationKeys.auth.enterAccount.tr(),
                style: Styles.textStyleMedium15(context).copyWith(
                  color: AppColors.getSecondaryTextColor(context),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              const SignUpForm(),
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizationKeys.auth.signUpViewAlreadyHaveAnAccount
                        .tr(),
                    style: Styles.textStyleSemiBold15(context).copyWith(
                      color: AppColors.getMainTextColor(context),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ClickableText(
                    onTap: () {
                      context.go(AppRouter.kLoginView);
                    },
                    text: AppLocalizationKeys.auth.logIn.tr(),
                    style: Styles.textStyleBold15(context).copyWith(
                      color: AppColors.getPrimaryColor(context),
                    ),
                  ),
                ],
              ),
              const Expanded(
                flex: 2,
                child: SizedBox(
                  height: 20,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
