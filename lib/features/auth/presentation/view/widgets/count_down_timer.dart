import 'dart:async';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme_colors_extension.dart';
import 'package:chefio_app/features/auth/presentation/manager/verification_code_cubit/verification_code_cubit.dart';
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
    _remainingSeconds =
        widget.seconds; // ✅ تحديد القيمة الافتراضية فقط بدون تشغيل التايمر
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel(); // ✅ تأكد من إلغاء أي تايمر قديم
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        if (mounted) {
          setState(() {
            _remainingSeconds--;
          });
        }
      } else {
        timer.cancel();
        BlocProvider.of<VerificationCodeCubit>(context).showSendAgain();
      }
    });
  }

  void restartTimer() {
    _timer?.cancel(); // ✅ إلغاء التايمر قبل البدء من جديد
    setState(() {
      _remainingSeconds = widget.seconds;
    });
    _startTimer();
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
    return BlocListener<VerificationCodeCubit, VerificationCodeState>(
      listener: (context, state) {
        if (state is SendVerificationCodeSuccess) {
          restartTimer(); // ✅ تشغيل العداد فقط عند استقبال الحالة المطلوبة
        }
        if (state is SendVerificationCodeFailure) {
          setState(() {
            _remainingSeconds = 0; // ✅ تصفير العداد عند الفشل
          });
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
