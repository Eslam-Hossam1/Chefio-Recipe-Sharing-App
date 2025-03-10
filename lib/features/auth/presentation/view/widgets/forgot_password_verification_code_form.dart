import 'dart:developer';

import 'package:chefio_app/core/Functions/get_auth_padding.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_verification_code_cubit/forgot_password_verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/code_expires_in.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_pin_code_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_verification_code_expires_in.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_verfication_send_again_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/send_again_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verifiy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordVerificationCodeForm extends StatefulWidget {
  const ForgotPasswordVerificationCodeForm({super.key});

  @override
  State<ForgotPasswordVerificationCodeForm> createState() =>
      _ForgotPasswordVerificationCodeFormState();
}

class _ForgotPasswordVerificationCodeFormState
    extends State<ForgotPasswordVerificationCodeForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  String? pinCodetext;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomPinCodeField(
            onSaved: (pinCodeText) {
              pinCodetext = pinCodeText;
            },
          ),
          SizedBox(
            height: 48,
          ),
          ForgotPasswordVerificationCodeExpiresIn(),
          SizedBox(
            height: 24,
          ),
          Column(
            children: [
              VerifyButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await BlocProvider.of<ForgotPasswordVerificationCodeCubit>(
                            context)
                        .verfiyForgotPasswordVerificationCode(
                            code: int.parse(pinCodetext!));
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              ForgotPasswordVerificationSendAgainButton(),
            ],
          ),
        ],
      ),
    );
  }
}
