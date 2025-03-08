import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpViewBodyTablet extends StatelessWidget {
  const SignUpViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TabletFormContainer(
      child: (context) => const SignUpViewBody(),
    );
  }
}
