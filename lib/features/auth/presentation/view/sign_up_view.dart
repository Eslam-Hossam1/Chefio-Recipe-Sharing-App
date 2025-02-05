import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_view_body_mobile_layout.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_view_body_tablet_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<SignUpCubit, SignUpState>(
    //   listener: (context, state) {
    //     if (state is SignUpFailure) {
    //       customAdaptiveAwesomeDialog(
    //         context,
    //         dialogType: DialogType.error,
    //         title: AppLocalizationKeys.global.error.tr(),
    //         desc: state.errorMessage,
    //         btnOkOnPress: () {},
    //       ).show();
    //     } else if (state is SignUpSuccess) {
    //       customAdaptiveAwesomeDialog(
    //         context,
    //         dialogType: DialogType.success,
    //         title: AppLocalizationKeys.global.success.tr(),
    //         desc:
    //             AppLocalizationKeys.auth.signUpViewWeSentEmailVerification.tr(),
    //         btnOkOnPress: () {},
    //         onDismissCallback: (_) {
    //           context.go(AppRouter.kLogInView);
    //         },
    //       ).show();
    //     }
    //   },
    //   builder: (context, state) {
    //   bool isLoading = state is SignUpLoading;
    return ModalProgressHUD(
      inAsyncCall: false,
      progressIndicator: const CustomCircularProgressIndicator(),
      child: Scaffold(
        body: SafeArea(
          child: AdaptiveLayout(
            mobileLayout: (context) => const SignUpViewBodyMobileLayout(),
            tabletLayout: (context) => const SignUpViewBodyTabletLayout(),
          ),
        ),
      ),
    );
    //   },
    // );
  }
}
