import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginViewBodyTablet extends StatelessWidget {
  const LoginViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return  TabletFormContainer(
      child: (context)=> const LoginViewBody(),
    );
  }
}