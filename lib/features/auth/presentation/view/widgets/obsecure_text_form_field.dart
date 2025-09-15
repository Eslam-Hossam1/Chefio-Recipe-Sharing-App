import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/form_styles.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/closed_eye_icon.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/opened_eye_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ObsecureTextFormField extends StatefulWidget {
  const ObsecureTextFormField({
    super.key,
    required this.hint,
    this.onSaved,
    this.validator,
    this.onChanged,
  });
  final String hint;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<ObsecureTextFormField> createState() => _ObsecureTextFormFieldState();
}

class _ObsecureTextFormFieldState extends State<ObsecureTextFormField> {
  bool isObscure = true;

  void toggleObsecure() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator:
          widget.validator ?? FormValidators.customTextFormFieldValidator,
      obscureText: isObscure,
      cursorColor: context.primaryColor,
      style: Styles.textStyleSemiBold15(context).copyWith(
        color: context.mainTextColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        hintText: widget.hint,
        hintStyle: Styles.textStyleMedium15(context).copyWith(
          color: context.secondaryTextColor,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 24, end: 10),
          child: SvgPicture.asset(
            Assets.imagesLock,
            colorFilter:
                ColorFilter.mode(context.mainTextColor, BlendMode.srcIn),
          ),
        ),
        suffixIconConstraints: BoxConstraints(),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 24.0,
          ),
          child: IconButton(
            onPressed: () {
              toggleObsecure();
            },
            icon: isObscure == true
                ? const OpenedEyeSvg()
                : const ClosedEyeIcon(),
          ),
        ),
        border: FormStyles.buildCustomTextFormFieldBorder(context),
        enabledBorder: FormStyles.buildCustomTextFormFieldBorder(context),
        focusedBorder:
            FormStyles.buildCustomTextFormFieldBorder(context).copyWith(
          borderSide: BorderSide(
            width: 2,
            color: context.primaryColor,
          ),
        ),
      ),
    );
  }
}
