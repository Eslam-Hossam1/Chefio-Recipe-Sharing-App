import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/features/notifiactions/data/models/notification_message_model.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_like_item.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notifications_follow_item.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/sliver_notifications_list.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerNotificationSliverList extends StatelessWidget {
  const SkeletonizerNotificationSliverList({super.key});
  static final NotificationEntity notificationEntity = NotificationEntity(
    chefUsername: 'ajsd;lfkaj;lsf',
    isFollowing: false,
    notificationId: 'asdfklj',
    chefId: 'asdfkj;l',
    type: 'adfa;lj',
    notificationMessageModel: NotificationMessageModel(
        localizationKey: AppLocalizationKeys.notifications.likedYourRecipe,
        message: 'aksdjfklajf;jaskljfsajfad',
        type: 'akjdf;klajsfkljsd'),
    recipeId: '',
    recipePicture: null,
    chefProfilePicture: null,
    createdAt: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      child: SliverList.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 24,
          );
        },
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return NotificationLikeItem(
              notificationEntity: notificationEntity,
            );
          } else {
            return NotificationFollowItem(
              notificationEntity: notificationEntity,
            );
          }
        },
      ),
    );
  }
}
