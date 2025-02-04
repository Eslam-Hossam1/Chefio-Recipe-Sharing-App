// GoRouter configuration
import 'package:chefio_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:chefio_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = "/homeview";
  static const kOnBoardingView = "/onboardingview";
  static const kSignUpView = "/signupview";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
          path: kOnBoardingView,
          builder: (context, state) => const OnBoardingView()),
    ],
  );
}
