// GoRouter configuration
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_sign_up_password_cubit/validate_sign_up_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
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
  static const kForgetPasswordView = "/Forgetpasswordview";
  static const kResetPasswordView = "/resetpasswordview";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kForgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kVerificationCodeView,
        builder: (context, state) => BlocProvider(
          create: (context) =>  VerificationCodeCubit(getIt<AuthRepoImpl>()),
          child:  VerificationCodeView(
          email:   state.extra as String,
          ),
        ),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SignUpCubit(getIt<AuthRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => ValidateSignUpPasswordCubit(),
            ),
          ],
          child: const SignUpView(),
        ),
      ),
    ],
  );
}
