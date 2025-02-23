import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
        backgroundColor: context.formColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 16,
            ),
            SvgPicture.asset(
              Assets.imagesSearch,
              colorFilter:
                  ColorFilter.mode(context.mainTextColor, BlendMode.srcIn),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              AppLocalizationKeys.global.search.tr(),
              style: Styles.textStyleMedium15(context).copyWith(
                color: context.secondaryTextColor,
              ),
            )
          ],
        ));
  }
}
