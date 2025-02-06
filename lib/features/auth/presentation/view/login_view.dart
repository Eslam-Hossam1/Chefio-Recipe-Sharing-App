import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/Functions/get_auth_padding.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<LogInCubit, LogInState>(
    //   listener: (context, state) {
    //     if (state is LogInFailure) {
    //       customAdaptiveAwesomeDialog(
    //         context,
    //         dialogType: DialogType.error,
    //         title: AppLocalizationKeys.global.error.tr(),
    //         desc: state.errorMessage,
    //         btnOkOnPress: () {},
    //       ).show();
    //     } else if (state is LogInSuccessButNeedVerification) {
    //       customAdaptiveAwesomeDialog(
    //         context,
    //         dialogType: DialogType.info,
    //         title: AppLocalizationKeys.global.info.tr(),
    //         desc:
    //             AppLocalizationKeys.auth.logInViewYourEmailNotVerifiedYet.tr(),
    //         btnOkOnPress: () {},
    //       ).show();
    //     } else if (state is LogInSuccessAndVerified) {
    //       context.go(AppRouter.kHomeView);
    //     }
    //   },
    //   builder: (context, state) {
    //     bool isLoading = state is LogInLoading;
    return ModalProgressHUD(
      inAsyncCall: false,
      progressIndicator: const CustomCircularProgressIndicator(),
      child: Scaffold(
        body: SafeArea(child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getAuthHorizontalPadding(context),),
          child: LoginViewBody(),
        )),
   
      ),
    );
    //   },
    // );
  }
}
