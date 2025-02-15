import 'dart:ui';

abstract class Constants {
  static const String kIsOnBoardingCompletedKey = "isOnBoardingOpenedBefore";
  static const Locale arabicLocale = Locale('ar');
  static const Locale englishLocale = Locale('en');
  static const double kMobileHorizontalPadding = 24;
  static const double kTabletHorizontalpadding = 36;
  static const double kDesignWidth = 375;
  static const double kDesignHeight = 812;
  static const Duration kSplashViewAnimationDelayDuration =
      Duration(milliseconds: 500);
  static const Duration kFadeInDuration = Duration(seconds: 1);
  static const Duration kSplashNavigationDelayDuration =
      Duration(milliseconds: 3000);
}
