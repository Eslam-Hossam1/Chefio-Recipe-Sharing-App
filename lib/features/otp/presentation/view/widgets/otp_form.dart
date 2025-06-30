import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/code_expires_in.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/custom_pin_code_field.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verification_code_send_again_button.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verifiy_button.dart';
import 'package:chefio_app/features/otp/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:chefio_app/features/otp/presentation/view/widgets/code_expires_in_builder.dart';
import 'package:chefio_app/features/otp/presentation/view/widgets/otp_send_again_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
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
          CodeExpiresInBuilder(),
          SizedBox(
            height: 24,
          ),
          Column(
            children: [
              VerifyButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await context.read<OtpCubit>().verfiyVerificationCode(
                          code: int.parse(
                            pinCodetext!,
                          ),
                        );
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
              OtpSendAgainButton(),
            ],
          ),
        ],
      ),
    );
  }
}
