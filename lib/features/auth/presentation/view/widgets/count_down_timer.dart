import 'dart:async';
import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int seconds;
  final VoidCallback? onResend; // Callback for "Resend Code"

  const CountdownTimer({super.key, required this.seconds, this.onResend});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingSeconds;
  Timer? _timer;
  bool _showResendButton = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _showResendButton = true; // Show the resend button
        });
      }
    });
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

    return Text(
            _formatTime(_remainingSeconds),
            style: Styles.textStyleMedium15(context).copyWith(
              color: AppColors.getSecondaryColor(context)
            ),
          );
    return _showResendButton
        ? TextButton(
            onPressed: widget.onResend,
            child: const Text("Resend Code"),
          )
        : Text(
            "Code expires in: ${_formatTime(_remainingSeconds)}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          );
  }
}
