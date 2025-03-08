import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/reset_password_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewBodyTablet extends StatelessWidget {
  const ResetPasswordViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return  TabletFormContainer(
        child: (context) => const ResetPasswordViewBody()
    );
  }
}