
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_like_item.dart';
import 'package:flutter/material.dart';

class SliverNotificationsList extends StatelessWidget {
  const SliverNotificationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 24,
        );
      },
      itemCount: 20,
      itemBuilder: (context, index) {
        return NotificationLikeItem();
      },
    );
  }
}
