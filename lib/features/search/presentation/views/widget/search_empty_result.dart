import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchEmptyResult extends StatelessWidget {
  const SearchEmptyResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              textAlign: TextAlign.center,
              AppLocalizationKeys.search.noResultsFound.tr(),
              style: Styles.textStyleMedium17(context)
                  .copyWith(color: context.mainTextColor),
            ),
          ),
        ));
  }
}
