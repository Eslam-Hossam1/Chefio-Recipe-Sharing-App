import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/clickable_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordClickableText extends StatelessWidget {
  const ForgotPasswordClickableText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClickableText(
      onTap: () {
        context.push(RoutePaths.forgetPassword);
      },
      text: AppLocalizationKeys.auth.forgetPasswordQuestion.tr(),
      style: Styles.textStyleSemiBold15(context).copyWith(
        color: context.mainTextColor,
      ),
    );
  }
}
