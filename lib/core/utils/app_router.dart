// GoRouter configuration
import 'package:chefio_app/core/utils/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_verification_code_cubit/forgot_password_verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/log_in_cubit.dart/log_in_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_reset_password/validate_reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_sign_up_password_cubit/validate_sign_up_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/forget_password_verfication_code_view.dart';
import 'package:chefio_app/features/home/presentation/view/home_view.dart';
import 'package:chefio_app/features/auth/presentation/view/login_view.dart';
import 'package:chefio_app/features/auth/presentation/view/reset_password_view.dart';
import 'package:chefio_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:chefio_app/features/auth/presentation/view/verification_code_view.dart';
import 'package:chefio_app/features/auth/presentation/view/forget_password_view.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/reset_password_done_button.dart';
import 'package:chefio_app/features/main/presentation/view/main_view.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/notifications_view_test.dart';
import 'package:chefio_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:chefio_app/features/profile/presentation/view/profile_view_test.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/recipe_details_view_test.dart';
import 'package:chefio_app/features/search/presentation/view/search_view_test.dart';
import 'package:chefio_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = "/home";
  static const kOnBoardingView = "/onboarding";
  static const kSignUpView = "/signup";
  static const kLoginView = "/login";
  static const kVerificationCodeView = "/verificationcode";
  static const kForgetPasswordView = "/forgetpassword";
  static const kResetPasswordView = "/resetpassword";
  static const kForgetPasswordVerificationCodeView =
      "/forgetpasswordverificationcode";
  static const kSearchView = '/search';
  static const kNotificationsView = '/notification';
  static const kProfileView = '/profile'; //
  static const kRecipeDetailsView = 'recipe-detail';

  ///context.gp('/dashboard/dashboard-detail');

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  static final _shellNavigatorSearchKey =
      GlobalKey<NavigatorState>(debugLabel: 'search');

  static final _shellNavigatorNotificationKey =
      GlobalKey<NavigatorState>(debugLabel: 'notification');
  static final _shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'profile');

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) {
          return MainScalffoldView(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                  path: kHomeView,
                  builder: (context, state) {
                    return const HomeView();
                  },
                  routes: [
                    GoRoute(
                        path: kRecipeDetailsView,
                        builder: (context, state) => const RecipeDetailsPage(),
                        routes: [])
                  ])
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSearchKey,
            routes: [
              GoRoute(
                  path: kSearchView,
                  builder: (context, state) {
                    return const SearchPage();
                  },
                  )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorNotificationKey,
            routes: [
              GoRoute(
                  path: kNotificationsView,
                  builder: (context, state) {
                    return const NotificationPage();
                  },
                 )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey,
            routes: [
              GoRoute(
                  path: kProfileView,
                  builder: (context, state) {
                    return const ProfilePage();
                  },
                  )
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      // GoRoute(
      //   path: kHomeView,
      //   builder: (context, state) => const HomeView(),
      // ),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ValidateSignUpPasswordCubit(),
            ),
            BlocProvider(
              create: (context) => ResetPasswordCubit(getIt<AuthRepoImpl>()),
            ),
          ],
          child: ResetPasswordView(
            email: state.extra as String,
          ),
        ),
      ),
      GoRoute(
        path: kForgetPasswordView,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt<AuthRepoImpl>()),
          child: const ForgetPasswordView(),
        ),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LogInCubit(getIt<AuthRepoImpl>(), getIt<AuthCredentialsHelper>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kVerificationCodeView,
        builder: (context, state) => BlocProvider(
          create: (context) => VerificationCodeCubit(getIt<AuthRepoImpl>()),
          child: VerificationCodeView(
            email: state.extra as String,
          ),
        ),
      ),
      GoRoute(
        path: kForgetPasswordVerificationCodeView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ForgotPasswordVerificationCodeCubit(getIt<AuthRepoImpl>()),
          child: ForgetPasswordVerificationCodeView(
            email: state.extra as String,
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
