import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SendAgainButton extends StatelessWidget {
  const SendAgainButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextButton(
            onPressed: onPressed,
            backgroundColor: Colors.transparent,
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.solid,
              color: context.outlineColor,
            ),
            child: Text(
              AppLocalizationKeys.auth.verificationCodeViewSendAgain.tr(),
              style: Styles.textStyleBold15(context).copyWith(
                color: context.secondaryTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
