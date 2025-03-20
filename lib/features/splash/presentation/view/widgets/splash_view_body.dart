import 'dart:developer';

import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/styles.dart';
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
    startFadeInAnimation();
    determineToGoView().then((toGoView) {
      navigationAfterDuration(toGoView);
    });
  }

  Future<String> determineToGoView() async {
    String toGoView = await getIt<SplashViewModel>().determineToGoView();
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

  navigationAfterDuration(String toGoView) {
    return Future.delayed(Constants.kSplashNavigationDelayDuration, () {
      if (mounted) {
        context.go(toGoView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Constants.kFadeInDuration,
            child: Text(
              "Chefio",
              style: Styles.textStyleExtraBold40(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
