
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class EditSubmitButton extends StatelessWidget {
  const EditSubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      width: double.infinity,
      child: Text(
        "Submit",
        style: Styles.textStyleBold15(context)
            .copyWith(color: Colors.white),
      ),
    );
  }
}
