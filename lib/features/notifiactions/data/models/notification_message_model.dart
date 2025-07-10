import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';

class NotificationMessageModel {
  final String message;
  final String localizationKey;
  final String type;

  NotificationMessageModel(
      {required this.message,
      required this.localizationKey,
      required this.type});
  factory NotificationMessageModel.fromType({required String type}) {
    if (type == ApiKeys.notificationLikeType) {
      return NotificationMessageModel(
        message: 'Liked your recipe',
        localizationKey: AppLocalizationKeys.notifications.likedYourRecipe,
        type: ApiKeys.notificationLikeType,
      );
    } else if (type == ApiKeys.notificationFollowType) {
      return NotificationMessageModel(
        message: 'Now following you',
        localizationKey: AppLocalizationKeys.notifications.nowFollowingYou,
        type: ApiKeys.notificationFollowType,
      );
    } else {
      return NotificationMessageModel(
        message: 'Uploaded new recipe',
        localizationKey: AppLocalizationKeys.notifications.uploadedNewRecipe,
        type: ApiKeys.notificationNewRecipeType,
      );
    }
  }
}
