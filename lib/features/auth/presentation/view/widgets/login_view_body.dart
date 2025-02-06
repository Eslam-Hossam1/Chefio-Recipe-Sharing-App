import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/clickable_text.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/login_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height *
                (107 / Constants.kDesignHeight),
          ),
          Text(
            textAlign: TextAlign.center,
            AppLocalizationKeys.auth.logInViewWelcomeBack.tr(),
            style: Styles.textStyleBold22(context).copyWith(
              color: AppColors.getMainTextColor(context),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            textAlign: TextAlign.center,
            AppLocalizationKeys.auth.enterAccount.tr(),
            style: Styles.textStyleMedium15(context).copyWith(
              color: AppColors.getSecondaryTextColor(context),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          const LoginForm(),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizationKeys.auth.logInViewDontHaveAnAccount.tr(),
                style: Styles.textStyleSemiBold15(context).copyWith(
                  color: AppColors.getMainTextColor(context),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ClickableText(
                onTap: () {},
                text: AppLocalizationKeys.auth.signup.tr(),
                style: Styles.textStyleBold15(context).copyWith(
                  color: AppColors.getPrimaryColor(context),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 41.h,
          )
        ],
      ),
    );
  }
}
