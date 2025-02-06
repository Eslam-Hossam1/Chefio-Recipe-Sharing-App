import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordDoneButton extends StatelessWidget {
  const ResetPasswordDoneButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextButton(
            onPressed: onPressed,
            child: Text(
              AppLocalizationKeys.auth.resetPasswordViewDone.tr(),
              style:
                  Styles.textStyleBold15(context).copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
