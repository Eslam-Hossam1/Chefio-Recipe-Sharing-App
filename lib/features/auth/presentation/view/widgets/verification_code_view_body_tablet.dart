import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verification_code_view_body.dart';
import 'package:flutter/material.dart';

class VerificationCodeViewBodyTablet extends StatelessWidget {
  const VerificationCodeViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TabletFormContainer(child: (context) => VerificationCodeViewBody());
  }
}
