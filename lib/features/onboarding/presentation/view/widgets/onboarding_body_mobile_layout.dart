import 'package:chefio_app/features/onboarding/presentation/view/widgets/on_boarding_bottom_section_mobile.dart';
import 'package:chefio_app/features/onboarding/presentation/view/widgets/onboarding_dishes_section.dart';
import 'package:flutter/material.dart';

class OnboardingBodyMobileLayout extends StatelessWidget {
  const OnboardingBodyMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Expanded(child: OnBourdingDishesSectionMobile()),
              const Expanded(child: OnBoardingBottomSectionMobile()),
            ],
          ),
        ),
      ],
    );
  }
}
