import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custome_email_text_form_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/recover_password_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autovalidateMode;
  String? email;

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
            height: 32.h,
          ),
          PasswordRecoveryButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await BlocProvider.of<ForgotPasswordCubit>(context)
                    .enterEmailtoRecoverPassword(email: email!);
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
        ],
      ),
    );
  }
}
