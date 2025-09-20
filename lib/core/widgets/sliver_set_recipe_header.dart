import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_cancel.dart';
import 'package:flutter/material.dart';

class SliverSetRecipeHeader extends StatelessWidget {
  const SliverSetRecipeHeader({
    super.key,
    required this.currentStep,
    required this.steps,
  });
  final String currentStep;
  final String steps;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCancel(),
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
      ),
    );
  }
}
