import 'package:chefio_app/features/otp/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:chefio_app/features/otp/presentation/view/widgets/code_expires_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CodeExpiresInBuilder extends StatelessWidget {
  const CodeExpiresInBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        if (state is ShowSendAgain) {
          return Center(
            child: Text('Code Expired, click send again '),
          );
        } else if (state is SendOtpFailure) {
          return Center(
            child: Text('Sending Code failed , click send again '),
          );
        } else {
          return CodeExpiresIn();
        }
      },
    );
  }
}
