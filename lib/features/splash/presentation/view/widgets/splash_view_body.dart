import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/features/splash/presentation/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late double _opacity;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final toGoView = determineToGoView();
        context.go(toGoView);
      }
    });
  }

  String determineToGoView() {
    String toGoView = getIt<SplashViewModel>().determineToGoView();
    return toGoView;
  }

  void startFadeInAnimation() {
    _opacity = 0;
    Future.delayed(Constants.kSplashViewAnimationDelayDuration, () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  navigationAfterSimpleDuration(String toGoView) {
    return Future.delayed(Constants.kSplashNavigationDelayDuration, () {
      if (mounted) {
        context.go(toGoView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
