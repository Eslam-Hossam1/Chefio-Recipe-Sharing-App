import 'dart:developer';

import 'package:chefio_app/core/Functions/show_custom_exit_confirmation_dialog.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_verification_code_cubit/forgot_password_verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_verification_code_body.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verification_code_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPasswordVerificationCodeView extends StatefulWidget {
  const ForgotPasswordVerificationCodeView({super.key, required this.email});
  final String email;
  @override
  State<ForgotPasswordVerificationCodeView> createState() =>
      _ForgotPasswordVerificationCodeViewState();
}

class _ForgotPasswordVerificationCodeViewState
    extends State<ForgotPasswordVerificationCodeView> {
  @override
  void initState() {
    BlocProvider.of<ForgotPasswordVerificationCodeCubit>(context)
        .initEmailAndStartTimer(email: widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordVerificationCodeCubit,
        ForgotPasswordVerificationCodeState>(
      listener: (context, state) {
        if (state is SendForgotPasswordVerificationCodeFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is VerifyForgotPasswordVerificationCodeFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is VerifyForgotPasswordVerificationCodeSuccess) {
          context.go(RoutePaths.resetPassword, extra: widget.email);
        }
      },
      builder: (context, state) {
        bool isLoading = state is ForgotPasswordVerificationCodeLoading;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CustomCircularProgressIndicator(),
          child: Scaffold(
            body: SafeArea(
              child: ForgotPasswordVerificationCodeViewBody(),
            ),
          ),
        );
      },
    );
  }
}
