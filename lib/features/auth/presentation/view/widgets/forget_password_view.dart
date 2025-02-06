import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chefio_app/core/Functions/get_auth__tablet_padding.dart';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/core/widgets/adaptive_layout_widget.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/forget_password_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
    //   listener: (context, state) {
    //     if (state is ForgetPasswordFailure) {
    //       DialogHelper.showErrorDialog(context, state.errorMessage);
    //     } else if (state is ForgetPasswordSuccess) {
    //       customAdaptiveAwesomeDialog(
    //         context,
    //         dialogType: DialogType.success,
    //         title: AppLocalizationKeys.global.success.tr(),
    //         desc: AppLocalizationKeys
    //             .auth.forgetPasswordViewPasswordResetLinkSent
    //             .tr(),
    //         btnOkOnPress: () {},
    //         onDismissCallback: (_) {
    //           context.go(AppRouter.kLogInView);
    //         },
    //       ).show();
    //     }
    //   },
    //   builder: (context, state) {
    //     bool isLoading = state is ForgetPasswordLoading;

    return ModalProgressHUD(
      inAsyncCall: false,
      progressIndicator: const CustomCircularProgressIndicator(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: _getPadding(context)),
          child: const ForgetPasswordViewBody(),
        ),
      ),
    );
    //   },
    // );
  }

  double _getPadding(BuildContext context) {
    return MediaQuery.sizeOf(context).width < SizeConfig.tabletBreakPoint
        ? Constants.kMobileHorizontalPadding
        : getAuthTabletPadding(context);
  }
}
