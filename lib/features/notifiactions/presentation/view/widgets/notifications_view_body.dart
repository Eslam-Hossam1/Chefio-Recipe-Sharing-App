import 'package:chefio_app/core/widgets/adaptive_padding.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_like_item.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/sliver_notifications_list.dart';
import 'package:flutter/material.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptivePadding(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          SliverNotificationsList()
        ],
      ),
    );
  }
}
