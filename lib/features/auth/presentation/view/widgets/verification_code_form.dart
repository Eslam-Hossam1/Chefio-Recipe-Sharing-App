import 'dart:developer';

import 'package:chefio_app/core/Functions/get_auth__tablet_padding.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/code_expires_in.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_pin_code_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/send_again_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verifiy_button.dart';
import 'package:flutter/material.dart';

class VerificationCodeForm extends StatefulWidget {
  const VerificationCodeForm({super.key});

  @override
  State<VerificationCodeForm> createState() => _VerificationCodeFormState();
}

class _VerificationCodeFormState extends State<VerificationCodeForm> {
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
          CodeExpiresIn(),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getAuthTabletPadding(context)),
            child: Column(
              children: [
                VerifyButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // await BlocProvider.of<SignUpCubit>(context)
                      //     .signUpWithEmailAndPassword(
                      //         email: email!, password: password!);
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
                SendAgainButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
