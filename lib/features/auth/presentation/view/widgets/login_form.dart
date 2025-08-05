import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/manager/log_in_cubit.dart/log_in_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custome_email_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_clickable_text.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/log_in_with_google_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/login_with_email_and_password_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/obsecure_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
          CustomeEmailTextFormField(onSaved: (value) {
            email = value;
          }),
          SizedBox(
            height: 16.h,
          ),
          ObsecureTextFormField(
            hint: AppLocalizationKeys.auth.passwordTextFieldHint.tr(),
            onSaved: (value) {
              password = value;
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          const Align(
            alignment: AlignmentDirectional.centerEnd,
            child: ForgotPasswordClickableText(),
          ),
          SizedBox(
            height: 72.h,
          ),
          Column(
            children: [
              LoginWithEmailAndPasswordButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await BlocProvider.of<LogInCubit>(context)
                        .logIn(email: email!, password: password!);
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                AppLocalizationKeys.auth.orContinueWith.tr(),
                style: Styles.textStyleMedium15(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              const LogInWithGoogleButton(),
            ],
          ),
        ],
      ),
    );
  }
}
