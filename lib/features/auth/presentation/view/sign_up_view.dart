import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/Functions/custom_adaptive_awesome_dialog.dart';
import 'package:chefio_app/core/Functions/get_auth_padding.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/signup_view_body_tablet.dart';
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
    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          mobileLayout: (context) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.kMobileHorizontalPadding,
            ),
            child: const SignUpViewBody(),
          ),
          tabletLayout: (context) => SignUpViewBodyTablet(),
        ),
      ),
    );
  }
}
