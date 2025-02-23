import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordDoneButton extends StatelessWidget {
  const ResetPasswordDoneButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is ResetPasswordSuccess) {
          DialogHelper.showSuccessDialog(
            context,
            successMessage:
                AppLocalizationKeys.auth.resetPasswordViewSuccess.tr(),
            btnOkOnPress: () => context.go(AppRouter.kLoginView),
            onDismissCallback: (_) => context.go(AppRouter.kLoginView),
          );
        }
      },
      builder: (context, state) {
         bool isLoading = state is ResetPasswordLoading;
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
                          AppLocalizationKeys.auth.resetPasswordViewDone.tr(),
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
