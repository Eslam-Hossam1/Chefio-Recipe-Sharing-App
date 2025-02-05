import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/clickable_text.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBodyMobileLayout extends StatelessWidget {
  const SignUpViewBodyMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.kMobileHorizontalPadding),
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
                    AppLocalizationKeys.auth.signUpViewWelcome.tr(),
                    style: Styles.textStyleBold22(context).copyWith(
                      color: AppColors.getMainTextColor(context),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    AppLocalizationKeys.auth.enterAccount.tr(),
                    style: Styles.textStyleMedium15(context).copyWith(
                      color: AppColors.getSecondaryTextColor(context),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const SignUpForm(),
                  const SizedBox(
                    height: 24,
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
                        width: 8,
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
                  Expanded(
                    child: const SizedBox(
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
