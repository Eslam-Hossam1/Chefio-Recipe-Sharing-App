import 'dart:async';

import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/features/otp/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownTimer extends StatefulWidget {
  final int seconds;

  const CountdownTimer({super.key, required this.seconds});

  @override
  State<CountdownTimer> createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
  }

  void _startTimer(int initialSeconds) {
    _remainingSeconds = initialSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        if (mounted) {
          setState(() {
            _remainingSeconds--;
          });
        }
      } else {
        _onFinish(timer);
      }
    });
  }

  void _onFinish(Timer timer) {
    timer.cancel();
    context.read<OtpCubit>().showSendAgain();
  }

  void restartTimer() {
    _timer?.cancel();
    _startTimer(widget.seconds);
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          _startTimer(widget.seconds);
        }
      },
      child: Text(
        _formatTime(_remainingSeconds),
        style: Styles.textStyleMedium15(context)
            .copyWith(color: context.secondaryColor),
      ),
    );
  }
}
