
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key, this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextButton(
            onPressed: onPressed,
            child: Text(AppLocalizationKeys.auth.verificationCodeViewVerify.tr(),style: Styles.textStyleBold15(context).copyWith(color: Colors.white),),
          ),
        ),
      ],
    );
  }
}
