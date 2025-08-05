import 'package:chefio_app/core/Functions/show_custom_exit_confirmation_dialog.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/reset_password_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;
  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  void initState() {
    BlocProvider.of<ResetPasswordCubit>(context).initEmail(email: widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        showCustomExitConfirmationDialog(context,
            errorMessage:
                AppLocalizationKeys.auth.resetPasswordExitWarning.tr(),
            btnOkOnPress: () => context.go(RoutePaths.login));
      },
      child: Scaffold(
        body: SafeArea(
                    child: const ResetPasswordViewBody(),
        ),
      ),
    );
  }
}
