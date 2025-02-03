import 'package:chefio_app/core/utils/colors.dart';
import 'package:chefio_app/features/splash/presentation/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getPrimaryColor(context),
      body: const SplashViewBody(),
    );
  }
}
