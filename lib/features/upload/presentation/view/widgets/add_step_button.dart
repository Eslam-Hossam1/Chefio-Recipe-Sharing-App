import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/add_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddStepButton extends StatelessWidget {
  const AddStepButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AddButton(
      onPressed: onPressed,
      text: AppLocalizationKeys.upload.addStep.tr(),
    );
  }
}
