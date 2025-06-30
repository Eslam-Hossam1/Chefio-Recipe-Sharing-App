import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class RoutingHelper {
  static String getRecipeDetailsPath({required String recipeId}) {
    return '${RoutePaths.recipeDetailsWithoutId}/$recipeId';
  }

  static String getProfilePath({required String chefId}) {
    return '${RoutePaths.profileWithoutId}/$chefId';
  }

  static pushOtp(BuildContext context, {required OtpReason otpReason}) {
    context.push(RoutePaths.otp, extra: otpReason);
  }

  static const String getSearchNestedRoutePath =
      '${RoutePaths.home}/${RoutePaths.search}';
}
