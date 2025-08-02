import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SetRecipeBackButton extends StatelessWidget {
  const SetRecipeBackButton({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: onBack,
      backgroundColor: context.formColor,
      child: Text(
        AppLocalizationKeys.global.back.tr(),
        style: Styles.textStyleBold15(context)
            .copyWith(color: context.mainTextColor),
      ),
    );
  }
}
