import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/routing/routing_helper.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:chefio_app/core/theme/styles.dart';
import 'package:chefio_app/core/widgets/custom_cicular_progress_indicator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:chefio_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chefio_app/features/otp/data/models/sign_up_reason.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errorLocalizationKey.tr(),
            btnOkOnPress: () {},
          );
        } else if (state is SignUpEmailRegisteredButNotVerified) {
          RoutingHelper.pushOtp(
            context,
            otpReason: SignUpReason(
              apiConsumer: getIt<DioConsumer>(),
              email: state.email,
            ),
          );
        } else if (state is SignUpSuccess) {
          RoutingHelper.pushOtp(
            context,
            otpReason: SignUpReason(
              apiConsumer: getIt<DioConsumer>(),
              email: state.email,
            ),
          );
        }
      },
      builder: (context, state) {
        bool isLoading = state is SignUpLoading;
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
                          AppLocalizationKeys.auth.signup.tr(),
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
