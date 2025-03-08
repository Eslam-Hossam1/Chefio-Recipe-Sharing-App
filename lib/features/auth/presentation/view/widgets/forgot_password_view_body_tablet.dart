import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewBodyTablet extends StatelessWidget {
  const ForgotPasswordViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TabletFormContainer(
        child: (context) => const ForgotPasswordViewBody());
  }
}
