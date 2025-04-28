import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/clickable_text.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
                AppLocalizationKeys.auth.signUpViewWelcome.tr(),
                style: Styles.textStyleBold22(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                textAlign: TextAlign.center,
                AppLocalizationKeys.auth.enterAccount.tr(),
                style: Styles.textStyleMedium15(context).copyWith(
                  color: context.secondaryTextColor,
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
                      color: context.mainTextColor,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ClickableText(
                    onTap: () {
                      context.go(RoutePaths.login);
                    },
                    text: AppLocalizationKeys.auth.logIn.tr(),
                    style: Styles.textStyleBold15(context).copyWith(
                      color: context.primaryColor,
                    ),
                  ),
                ],
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
