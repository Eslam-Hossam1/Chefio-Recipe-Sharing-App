
import 'package:chefio_app/features/auth/presentation/manager/forgot_password_verification_code_cubit/forgot_password_verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/send_again_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordVerificationSendAgainButton extends StatelessWidget {
  const ForgetPasswordVerificationSendAgainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordVerificationCodeCubit,
        ForgotPasswordVerificationCodeState>(
      builder: (context, state) {
        if (state is ShowSendAgain) {
          return SendAgainButton(
            onPressed: () {
              BlocProvider.of<ForgotPasswordVerificationCodeCubit>(
                      context)
                  .resendForgotPasswordVerificationCode();
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
