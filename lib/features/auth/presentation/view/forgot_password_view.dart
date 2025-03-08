import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/Functions/get_auth_padding.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_view_body.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forgot_password_view_body_tablet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      progressIndicator: const CustomCircularProgressIndicator(),
      child: Scaffold(
        body: SafeArea(
          child: AdaptiveLayout(
            mobileLayout: (context) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Constants.kMobileHorizontalPadding),
              child: const ForgotPasswordViewBody(),
            ),
            tabletLayout: (context) => ForgotPasswordViewBodyTablet(),
          ),
        ),
      ),
    );
  }
}
