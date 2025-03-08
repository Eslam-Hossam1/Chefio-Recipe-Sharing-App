import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/core/utils/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_verification_code_cubit/forgot_password_verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/log_in_cubit.dart/log_in_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_sign_up_password_cubit/validate_sign_up_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/forgot_password_verfication_code_view.dart';
import 'package:chefio_app/features/auth/presentation/view/login_view.dart';
import 'package:chefio_app/features/auth/presentation/view/reset_password_view.dart';
import 'package:chefio_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:chefio_app/features/auth/presentation/view/verification_code_view.dart';
import 'package:chefio_app/features/auth/presentation/view/forgot_password_view.dart';
import 'package:chefio_app/features/main/presentation/view/main_view.dart';
import 'package:chefio_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:chefio_app/features/splash/presentation/view/splash_view.dart';
import 'shell_branches.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: RoutePaths.splash,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return MainScaffoldView(navigationShell: navigationShell);
        },
        branches: ShellBranches.branches,
      ),
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RoutePaths.onboarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LogInCubit(getIt<AuthRepoImpl>(), getIt<AuthCredentialsHelper>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RoutePaths.signup,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => SignUpCubit(getIt<AuthRepoImpl>())),
            BlocProvider(create: (context) => ValidateSignUpPasswordCubit()),
          ],
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: RoutePaths.verificationCode,
        builder: (context, state) => BlocProvider(
          create: (context) => VerificationCodeCubit(getIt<AuthRepoImpl>()),
          child: VerificationCodeView(email: state.extra as String),
        ),
      ),
      GoRoute(
        path: RoutePaths.forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt<AuthRepoImpl>()),
          child: const ForgotPasswordView(),
        ),
      ),
      GoRoute(
        path: RoutePaths.forgotPasswordVerificationCode,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ForgotPasswordVerificationCodeCubit(getIt<AuthRepoImpl>()),
          child:
              ForgotPasswordVerificationCodeView(email: state.extra as String),
        ),
      ),
      GoRoute(
        path: RoutePaths.resetPassword,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ValidateSignUpPasswordCubit()),
            BlocProvider(
                create: (context) => ResetPasswordCubit(getIt<AuthRepoImpl>())),
          ],
          child: ResetPasswordView(email: state.extra as String),
        ),
      ),
    ],
  );
}
