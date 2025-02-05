import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/obsecure_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_password_standards_column.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_with_email_and_password_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  String? email;
  String? password;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hint: AppLocalizationKeys.auth.usernameTextFeildHint.tr(),
            prefixIcon: Icon(
              FontAwesomeIcons.user,
              size: 24,
              color: AppColors.getMainTextColor(context),
            ),
            onSaved: (value) {
              email = value;
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomTextFormField(
            hint: AppLocalizationKeys.auth.emailTextFeildHint.tr(),
            onSaved: (value) {
              email = value;
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          ObsecureTextFormField(
            validator: (password) {
              // return BlocProvider.of<ValidateSignUpPasswordCubit>(context)
              //     .passwordTextFieldValidator(password);
            },
            onChanged: (password) {
              // BlocProvider.of<ValidateSignUpPasswordCubit>(context)
              //     .validatePasswordOnChange(password: password);
            },
            hint: AppLocalizationKeys.auth.passwordTextFieldHint.tr(),
            onSaved: (value) {
              password = value;
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          const SignUpPasswordStandardsColumn(),
          SizedBox(
            height: 48.h,
          ),
          SignUpWithEmailAndPasswordButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // await BlocProvider.of<SignUpCubit>(context)
                //     .signUpWithEmailAndPassword(
                //         email: email!, password: password!);
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
