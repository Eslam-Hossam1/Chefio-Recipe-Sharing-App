import 'dart:developer';

import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/helpers/share_helper.dart';
import 'package:chefio_app/core/utils/cache/shared_prefernce_helper.dart';
import 'package:chefio_app/features/profile/presentation/views/profile_view.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo_impl.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_actions_cubit/recipe_details_actions_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_details_cubit/recipe_details_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/manager/recipe_likers_cubit/recipe_likers_cubit.dart';
import 'package:chefio_app/features/recipe_details/presentation/view/recipe_details_view.dart';
import 'package:chefio_app/features/upload/data/repos/upload_repo_impl.dart';
import 'package:chefio_app/features/upload/presentation/manager/add_cover_photo_cubit.dart/add_cover_photo_cubit.dart';
import 'package:chefio_app/features/upload/presentation/manager/upload_recipe_cubit/upload_recipe_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/upload_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
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
    redirect: (context, state) {
      log('location: ${state.uri.path}');
      log('uri: ${state.uri}');
      log('pathSegments: ${state.uri.pathSegments}');
      log('queryParameters: ${state.uri.queryParameters}');

      final isLoggedIn = getIt<AuthCredentialsHelper>().userIsAuthenticated();

      // لو جالك deep link وانت مسجل دخول
      if (state.uri.pathSegments.contains('recipe-details')) {
        // لو مش مسجل دخول
        if (!isLoggedIn) {
          return RoutePaths.login;
        }

        final recipeId = state.uri.pathSegments.last;
        return RoutingHelper.getRecipeDetailsPath(recipeId: recipeId);
      }

      return null; // معناها كمل طبيعي
    },
    initialLocation: RoutePaths.profile,
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
        path: RoutePaths.profile,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
          path: RoutePaths.recipeDetails,
          builder: (context, state) {
            final String recipeId = state.pathParameters['id']!;
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RecipeDetailsCubit(
                    getIt<RecipeDetailsRepoImpl>(),
                  ),
                ),
                BlocProvider(
                  create: (context) => RecipeDetailsActionsCubit(
                    authCredentialsHelper: getIt<AuthCredentialsHelper>(),
                    shareHelper: getIt<ShareHelper>(),
                  ),
                ),
              ],
              child: RecipeDetailsView(
                id: recipeId,
              ),
            );
          }),
      GoRoute(
        path: RoutePaths.upload,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UploadRecipeCubit(getIt<UploadRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  AddCoverPhotoCubit(getIt<CroppedImagePickerHelper>()),
            ),
          ],
          child:
              UploadView(recipeDetailModel: state.extra as RecipeDetailsModel?),
        ),
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
