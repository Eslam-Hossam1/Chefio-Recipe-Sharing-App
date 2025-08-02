import 'package:chefio_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingStartButton extends StatelessWidget {
  const OnBoardingStartButton({super.key, this.btnTextStyle});
  final TextStyle? btnTextStyle;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () async {
        await setOnBoardingCompletedToTrueThenNavigate(context);
      },
      width: double.infinity,
      child: Text(
        AppLocalizationKeys.onBoarding.buttonText.tr(),
        style: btnTextStyle,
      ),
    );
  }

  Future<void> setOnBoardingCompletedToTrueThenNavigate(
      BuildContext context) async {
    await getIt<OnBoardingCacheHelper>().setOnBoardingCompletedToTrue(context);
    if (context.mounted) {
      context.go(RoutePaths.signup);
    }
  }
}
