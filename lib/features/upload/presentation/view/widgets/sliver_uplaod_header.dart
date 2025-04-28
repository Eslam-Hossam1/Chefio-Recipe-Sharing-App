import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliverUploadHeader extends StatelessWidget {
  const SliverUploadHeader({
    super.key,
    required this.currentStep,
    required this.steps,
  });
  final String currentStep;
  final String steps;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Text(
              AppLocalizationKeys.global.cancel.tr(),
              style: Styles.textStyleBold17(context).copyWith(
                color: context.secondaryColor,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                '$currentStep/',
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              Text(
                steps,
                style: Styles.textStyleBold17(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
