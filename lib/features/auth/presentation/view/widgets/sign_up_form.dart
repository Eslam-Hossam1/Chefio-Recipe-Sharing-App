import 'package:chefio_app/core/Functions/form_validators.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_password_cubit/validate_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custome_email_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/obsecure_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/password_standards/password_standards_column.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_button.dart';
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
  String? username;
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
              color: context.mainTextColor,
            ),
            onSaved: (value) {
              username = value?.trim();
            },
            validator: FormValidators.usernameTextFormFieldValidator,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomeEmailTextFormField(
            onSaved: (value) {
              email = value?.trim();
            },
            initialValue: context.read<SignUpCubit>().email,
          ),
          SizedBox(
            height: 16.h,
          ),
          ObsecureTextFormField(
            validator: BlocProvider.of<ValidatePasswordCubit>(context)
                .passwordTextFieldValidator,
            onChanged: BlocProvider.of<ValidatePasswordCubit>(context)
                .validatePasswordOnChange,
            hint: AppLocalizationKeys.auth.passwordTextFieldHint.tr(),
            onSaved: (value) {
              password = value?.trim();
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          const PasswordStandardsColumn(),
          SizedBox(
            height: 48.h,
          ),
          SignUpButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await BlocProvider.of<SignUpCubit>(context).signUp(
                    username: username!, email: email!, password: password!);
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
