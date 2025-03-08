import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_verification_code_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordVerificationCodeViewBodyTablet extends StatelessWidget {
  const ForgotPasswordVerificationCodeViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TabletFormContainer(child: (context)=>ForgotPasswordVerificationCodeViewBody());
  }
}