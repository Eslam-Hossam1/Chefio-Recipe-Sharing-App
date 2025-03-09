import 'dart:math';

import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchTextButton extends StatelessWidget {
  const SearchTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        context.go('${RoutePaths.home}/${RoutePaths.recipeDetails}');
      },
      backgroundColor: context.formColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Assets.imagesSearch,
              colorFilter:
                  ColorFilter.mode(context.mainTextColor, BlendMode.srcIn),
            ),
            SizedBox(
              width: min((MediaQuery.sizeOf(context).width * .05), 50),
            ),
            Text(
              AppLocalizationKeys.global.search.tr(),
              style: Styles.textStyleMedium15(context).copyWith(
                color: context.secondaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
