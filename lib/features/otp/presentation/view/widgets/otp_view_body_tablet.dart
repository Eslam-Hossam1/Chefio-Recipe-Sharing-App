import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/otp/presentation/view/widgets/otp_view_body.dart';
import 'package:flutter/material.dart';

class OtpViewBodyTablet extends StatelessWidget {
  const OtpViewBodyTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TabletFormContainer(
      child: (context) => OtpViewBody(),
    );
  }
}
