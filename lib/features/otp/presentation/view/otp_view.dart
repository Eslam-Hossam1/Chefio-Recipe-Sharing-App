import 'package:chefio_app/core/Functions/show_custom_exit_confirmation_dialog.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:chefio_app/features/otp/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:chefio_app/features/otp/presentation/view/widgets/otp_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OtpView extends StatefulWidget {
  const OtpView({
    super.key,
  });
  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  void initState() {
    context.read<OtpCubit>().sendVerificationCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OtpReason otpReason = context.read<OtpCubit>().otpReason;
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is SendOtpFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
          context.read<OtpCubit>().showSendAgain();
        } else if (state is VerifyOtpFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is VerifyOtpSuccess) {
          otpReason.onSuccess(context);
        }
      },
      builder: (context, state) {
        bool isLoading = state is OtpLoading;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CustomCircularProgressIndicator(),
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;
              showCustomExitConfirmationDialog(
                context,
                errorMessage:
                    otpReason.localizationExitWarningConfirmation.tr(),
                btnOkOnPress: () => context.pop(),
              );
            },
            child: Scaffold(
              body: SafeArea(
                child: OtpViewBody()
              ),
            ),
          ),
        );
      },
    );
  }
}
