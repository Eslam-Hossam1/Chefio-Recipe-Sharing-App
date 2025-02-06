// GoRouter configuration
import 'package:chefio_app/features/auth/presentation/view/login_view.dart';
import 'package:chefio_app/features/auth/presentation/view/reset_password_view.dart';
import 'package:chefio_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:chefio_app/features/auth/presentation/view/verification_code_view.dart';
import 'package:chefio_app/features/auth/presentation/view/forget_password_view.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/reset_password_done_button.dart';
import 'package:chefio_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:chefio_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = "/homeview";
  static const kOnBoardingView = "/onboardingview";
  static const kSignUpView = "/signupview";
  static const kLoginView = "/loginview";
  static const kVerificationCodeView = "/verificationcodeview";
  static const kForgetPasswordView = "/ForgetPasswordView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kVerificationCodeView,
        builder: (context, state) => const VerificationCodeView(),
      ),
      GoRoute(
          path: kOnBoardingView,
          builder: (context, state) => const OnBoardingView()),
      GoRoute(
          path: kSignUpView, builder: (context, state) => const SignUpView()),
    ],
  );
}
