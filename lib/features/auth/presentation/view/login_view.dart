import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/Functions/get_auth_padding.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/tablet_form_container.dart';
import 'package:chefio_app/features/auth/presentation/manager/log_in_cubit.dart/log_in_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/login_view_body_tablet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is LogInNeedVerification) {
          context.go(RoutePaths.verificationCode, extra: state.email);
        } else if (state is LogInSuccess) {
          context.go(RoutePaths.home);
        }
      },
      builder: (context, state) {
        bool isLoading = state is LogInLoading;
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CustomCircularProgressIndicator(),
          child: Scaffold(
            body: SafeArea(
              child: AdaptiveLayout(
                mobileLayout: (context) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.kMobileHorizontalPadding,
                  ),
                  child: LoginViewBody(),
                ),
                tabletLayout: (context) => LoginViewBodyTablet(),
              ),
            ),
          ),
        );
      },
    );
  }
}
