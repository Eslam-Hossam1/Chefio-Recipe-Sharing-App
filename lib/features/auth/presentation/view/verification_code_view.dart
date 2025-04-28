import 'package:chefio_app/core/Functions/show_custom_exit_confirmation_dialog.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verification_code_view_body.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/verification_code_view_body_tablet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key, required this.email});
  final String email;
  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  @override
  void initState() {
    BlocProvider.of<VerificationCodeCubit>(context)
        .sendVerificationCode(email: widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCodeCubit, VerificationCodeState>(
      listener: (context, state) {
        if (state is SendVerificationCodeFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is VerifyVerificationCodeFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is VerifyVerificationCodeSuccess) {
          DialogHelper.showSuccessDialog(
            context,
            successMessage: AppLocalizationKeys
                .auth.verificationCodeViewSuccessMessage
                .tr(),
            btnOkOnPress: () {
              context.go(RoutePaths.login);
            },
            onDismissCallback: (_) {
              context.go(RoutePaths.login);
            },
          );
        }
      },
      builder: (context, state) {
        bool isLoading = state is VerificationCodeLoading;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CustomCircularProgressIndicator(),
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;
              showCustomExitConfirmationDialog(
                context,
                errorMessage: AppLocalizationKeys
                    .auth.verificationCodeViewExitWarning
                    .tr(),
                btnOkOnPress: () => context.go(RoutePaths.signup),
              );
            },
            child: Scaffold(
              body: SafeArea(
                child: AdaptiveLayout(
                  mobileLayout: (context) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Constants.kMobileHorizontalPadding),
                    child: VerificationCodeViewBody(),
                  ),
                  tabletLayout: (context) => VerificationCodeViewBodyTablet(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
