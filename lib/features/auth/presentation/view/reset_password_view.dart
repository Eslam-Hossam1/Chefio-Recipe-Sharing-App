import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/Functions/get_auth_padding.dart';
import 'package:chefio_app/core/Functions/show_custom_exit_confirmation_dialog.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/reset_password_body.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/reset_password_view_body_tablet.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
          child: AdaptiveLayout(
              mobileLayout: (context) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Constants.kMobileHorizontalPadding),
                    child: const ResetPasswordViewBody(),
                  ),
              tabletLayout: (context) => ResetPasswordViewBodyTablet()),
        ),
      ),
    );
  }
}
