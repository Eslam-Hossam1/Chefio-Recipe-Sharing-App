import 'package:chefio_app/features/auth/presentation/view/widgets/verification_code_view_body.dart';
import 'package:flutter/material.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VerificationCodeViewBody(),
      ),
    );
  }
}