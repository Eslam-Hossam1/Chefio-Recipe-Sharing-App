import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/onboarding/presentation/view/widgets/on_boarding_get_start_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          OnBoardingStartButton(
              btnTextStyle: Styles.textStyleBold17(context).copyWith(
            color: Colors.white,
          )),
          SizedBox(
            height: MediaQuery.sizeOf(context).height *
                (32 / Constants.kDesignHeight),
          ),
        ],
      ),
    );
  }
}
