import 'package:chefio_app/features/onboarding/presentation/view/widgets/on_boarding_bottom_section_tablet.dart';
import 'package:chefio_app/features/onboarding/presentation/view/widgets/onboarding_dishes_section.dart';
import 'package:chefio_app/features/onboarding/presentation/view/widgets/onboarding_dishes_section_tablet.dart';
import 'package:flutter/material.dart';

class OnboardingBodyTabletLayout extends StatelessWidget {
  const OnboardingBodyTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Expanded(flex: 2, child: OnBourdingDishesSectionTablet()),
              const Expanded(child: OnBoardingBottomSectionTablet()),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
