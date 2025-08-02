// file: lib/core/utils/routing/onboarding_routes.dart

import 'package:go_router/go_router.dart';
import 'package:chefio_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:chefio_app/core/routing/routs.dart';

class OnboardingRoutes {
  static GoRoute onboarding = GoRoute(
    path: RoutePaths.onboarding,
    builder: (context, state) => const OnBoardingView(),
  );

  static List<GoRoute> routes = [
    onboarding,
  ];
}
