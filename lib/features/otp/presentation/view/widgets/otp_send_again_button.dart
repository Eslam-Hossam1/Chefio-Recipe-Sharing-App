import 'package:chefio_app/features/otp/presentation/view/widgets/send_again_button.dart';
import 'package:chefio_app/features/otp/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpSendAgainButton extends StatelessWidget {
  const OtpSendAgainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        if (state is ShowSendAgain) {
          return SendAgainButton(
            onPressed: () {
              context.read<OtpCubit>().resendVerificationCode();
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
