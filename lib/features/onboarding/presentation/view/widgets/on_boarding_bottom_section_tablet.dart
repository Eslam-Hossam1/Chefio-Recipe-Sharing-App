import 'package:chefio_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnBoardingBottomSectionTablet extends StatelessWidget {
  const OnBoardingBottomSectionTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * .20),
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            AppLocalizationKeys.onBoarding.title.tr(),
            style: Styles.textStyleBold30(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            textAlign: TextAlign.center,
            AppLocalizationKeys.onBoarding.body.tr(),
            style: Styles.textStyleMedium24(context).copyWith(
              color: context.secondaryTextColor,
            ),
          ),
          Expanded(
              flex: 2,
              child: SizedBox(
                height: 32.h,
              )),
          Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  onPressed: () async {
                    await setOnBoardingCompletedToTrueThenNavigate(context);
                  },
                  child: Text(AppLocalizationKeys.onBoarding.buttonText.tr(),
                      style: Styles.textStyleBold17(context).copyWith(
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height *
                (32 / Constants.kDesignHeight),
          ),
        ],
      ),
    );
  }

  Future<void> setOnBoardingCompletedToTrueThenNavigate(
      BuildContext context) async {
    await getIt<OnBoardingCacheHelper>().setOnBoardingCompletedToTrue(context);
    if (context.mounted) {
      context.push(RoutePaths.signup);
    }
  }
}
