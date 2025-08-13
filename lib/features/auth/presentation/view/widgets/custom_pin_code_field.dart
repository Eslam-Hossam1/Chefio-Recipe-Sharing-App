import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField(
      {super.key, this.onChanged, this.onCompleted, this.onSaved});
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autovalidateMode: AutovalidateMode.disabled,
      onSaved: onSaved,
      validator: FormValidators.pincodeTextFormFieldValidator,
      pastedTextStyle:
          Styles.textStyleBold15(context).copyWith(color: context.primaryColor),
      appContext: context,
      length: 6,
      textStyle: Styles.textStyleSemiBold34(context)
          .copyWith(color: context.mainTextColor),
      showCursor: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(16.r),
        fieldHeight: getfieldWidth(context),
        fieldWidth: getfieldWidth(context),
        activeColor: context.primaryColor,
        inactiveColor: context.outlineColor,
        selectedColor: Colors.blue,
      ),
      onChanged: onChanged, // Optional for real-time input tracking
      onCompleted: onCompleted, // Callback when the user completes input
    );
  }

  double getfieldWidth(context) {
    double width = MediaQuery.sizeOf(context).width;
    return (48 * (width / Constants.kDesignWidth)).clamp(18, 60);
  }
}
