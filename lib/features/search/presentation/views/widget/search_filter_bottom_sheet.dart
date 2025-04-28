import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/search/presentation/views/widget/search_filter_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchFilterBottomSheet extends StatelessWidget {
  const SearchFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            'Add A Filter',
            style: Styles.textStyleBold17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${AppLocalizationKeys.upload.cookingDuration.tr()} ',
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              Text(
                AppLocalizationKeys.upload.inMinutes.tr(),
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          SearchFilterSlider(),
        ],
      ),
    );
  }
}
