import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';

import '../models/time_ago.dart';

TimeAgo getTimeAgo(DateTime createdAt) {
  final now = DateTime.now();
  final diff = now.difference(createdAt);

  if (diff.inSeconds < 60) {
    return TimeAgo(value: diff.inSeconds, unit: 's',unitLoclaizationKey: AppLocalizationKeys.timeUnits.s,);
  } else if (diff.inMinutes < 60) {
    return TimeAgo(value: diff.inMinutes, unit: 'm',unitLoclaizationKey: AppLocalizationKeys.timeUnits.m,);
  } else if (diff.inHours < 24) {
    return TimeAgo(value: diff.inHours, unit: 'h',unitLoclaizationKey: AppLocalizationKeys.timeUnits.h,);
  } else {
    return TimeAgo(value: diff.inDays, unit: 'd',unitLoclaizationKey: AppLocalizationKeys.timeUnits.d,);
  }
}