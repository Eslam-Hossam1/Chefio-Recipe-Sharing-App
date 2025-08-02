import 'package:chefio_app/core/routing/routing_helper.dart';
import 'package:chefio_app/features/notifiactions/data/models/notification_model.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_recipe_Image.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_user_with_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationLikeItem extends StatelessWidget {
  const NotificationLikeItem({
    super.key,
    required this.notificationEntity,
  });
  final NotificationEntity notificationEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NotificationUserWithMessage(
            notificationEntity: notificationEntity,
          ),
        ),
        SizedBox(
          width: 6,
        ),
        NotificationRecipeImage(
          notitficationEntity: notificationEntity,
        ),
      ],
    );
  }
}
