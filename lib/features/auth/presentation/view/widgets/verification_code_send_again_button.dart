import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
import 'package:chefio_app/features/auth/presentation/view/widgets/send_again_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeSendAgainButton extends StatelessWidget {
  const VerificationCodeSendAgainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
        builder: (context, state) {
      if (state is ShowSendAgain) {
        return SendAgainButton(
          onPressed: () {
            BlocProvider.of<VerificationCodeCubit>(context)
                .resendVerificationCode();
          },
        );
      } else {
        return SizedBox();
      }
    });
  }
}
