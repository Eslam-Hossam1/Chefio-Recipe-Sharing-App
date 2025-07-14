// file: lib/core/utils/routing/auth_routes.dart

import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chefio_app/features/auth/presentation/manager/log_in_cubit.dart/log_in_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/validate_password_cubit/validate_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/login_view.dart';
import 'package:chefio_app/features/auth/presentation/view/sign_up_view.dart';
import 'package:chefio_app/features/auth/presentation/view/forgot_password_view.dart';
import 'package:chefio_app/features/auth/presentation/view/reset_password_view.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:chefio_app/features/otp/data/repos/otp_repo_impl.dart';
import 'package:chefio_app/features/otp/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:chefio_app/features/otp/presentation/view/otp_view.dart';

class AuthRoutes {
  static GoRoute login = GoRoute(
    path: RoutePaths.login,
    builder: (context, state) => BlocProvider(
      create: (context) => LogInCubit(
        getIt<AuthRepoImpl>(),
        getIt<AuthCredentialsHelper>(),
      ),
      child: const LoginView(),
    ),
  );

  static GoRoute signup = GoRoute(
    path: RoutePaths.signup,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit(getIt<AuthRepoImpl>())),
        BlocProvider(create: (context) => ValidatePasswordCubit()),
      ],
      child: const SignUpView(),
    ),
  );

  static GoRoute forgotPassword = GoRoute(
    path: RoutePaths.forgetPassword,
    builder: (context, state) => BlocProvider(
      create: (context) => ForgotPasswordCubit(getIt<AuthRepoImpl>()),
      child: const ForgotPasswordView(),
    ),
  );

  static GoRoute resetPassword = GoRoute(
    path: RoutePaths.resetPassword,
    builder: (context, state) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ValidatePasswordCubit()),
        BlocProvider(
            create: (context) => ResetPasswordCubit(getIt<AuthRepoImpl>())),
      ],
      child: ResetPasswordView(email: state.extra as String),
    ),
  );

  static GoRoute otp = GoRoute(
      path: RoutePaths.otp,
      builder: (context, state) {
        final OtpReason otpReason = state.extra as OtpReason;
        return BlocProvider(
          create: (context) => OtpCubit(
            otpRepo: getIt<OtpRepoImpl>(),
            otpReason: otpReason,
          ),
          child: OtpView(),
        );
      });

  static List<GoRoute> routes = [
    login,
    signup,
    forgotPassword,
    resetPassword,
    otp,
  ];
}
