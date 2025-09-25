import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditSubmitButton extends StatelessWidget {
  const EditSubmitButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: onPressed,
      width: double.infinity,
      child: Text(
       AppLocalizationKeys.global.submit.tr(),
        style: Styles.textStyleBold15(context).copyWith(color: Colors.white),
      ),
    );
  }
}
