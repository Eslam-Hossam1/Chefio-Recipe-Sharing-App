import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/features/notifiactions/data/models/notification_model.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:chefio_app/features/notifiactions/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_like_item.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notifications_follow_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverNotificationsList extends StatelessWidget {
  const SliverNotificationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<NotificationEntity> notifications =
        context.read<NotificationsCubit>().notifications;
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 24,
        );
      },
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        if (notifications[index].type == ApiKeys.notificationLikeType ||
            notifications[index].type == ApiKeys.notificationNewRecipeType) {
          return NotificationLikeItem(
            notificationEntity: notifications[index],
          );
        } else {
          return NotificationFollowItem(
            notificationEntity: notifications[index],
          );
        }
      },
    );
  }
}
