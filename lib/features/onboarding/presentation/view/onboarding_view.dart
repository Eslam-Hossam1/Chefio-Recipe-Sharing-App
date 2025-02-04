import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/features/onboarding/presentation/view/widgets/onboarding_body_mobile_layout.dart';
import 'package:chefio_app/features/onboarding/presentation/view/widgets/onboarding_body_tablet_layout.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          mobileLayout: (context) => OnboardingBodyMobileLayout(),
          tabletLayout: (context) => OnboardingBodyTabletLayout(),
        ),
      ),
    );
  }
}
