import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      progressIndicator: const CustomCircularProgressIndicator(),
      child: Scaffold(
        body: SafeArea(
                        child: const ForgotPasswordViewBody(),

        ),
      ),
    );
  }
}
