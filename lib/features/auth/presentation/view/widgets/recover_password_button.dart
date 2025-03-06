import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PasswordRecoveryButton extends StatelessWidget {
  const PasswordRecoveryButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizaitonKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is ForgotPasswordSuccess) {
          context.push(RoutePaths.forgetPasswordVerificationCode,
              extra: state.email);
        }
      },
      builder: (context, state) {
        bool isLoading = state is ForgotPasswordLoading;

        return Row(
          children: [
            Expanded(
              child: AbsorbPointer(
                absorbing: isLoading,
                child: CustomTextButton(
                  onPressed: onPressed,
                  child: isLoading
                      ? Center(
                          child: CustomCircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Text(
                          AppLocalizationKeys.auth.confirm.tr(),
                          style: Styles.textStyleBold15(context)
                              .copyWith(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
