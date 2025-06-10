import 'package:chefio_app/core/utils/get_time_ago.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:chefio_app/core/utils/styles.dart';
import 'package:chefio_app/core/utils/theme/theme_colors_extension.dart';
import 'package:chefio_app/core/widgets/custom_circle_image.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationUserWithMessage extends StatelessWidget {
  const NotificationUserWithMessage({
    super.key,
    required this.notificationEntity,
  });
  final NotificationEntity notificationEntity;
  @override
  Widget build(BuildContext context) {
    String notificationTimeAgo =
        '${getTimeAgo(notificationEntity.createdAt).value}${getTimeAgo(notificationEntity.createdAt).unitLoclaizationKey.tr()}';
    return GestureDetector(
      onTap: () {
        context.push(
          RoutingHelper.getProfilePath(
            chefId: notificationEntity.chefId,
          ),
        );
      },
      child: Row(
        children: [
          CustomNetworkCircleImage(
            baseSize: 52,
            userImageUrl: notificationEntity.chefProfilePicture,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    maxLines: 1,
                    notificationEntity.chefUsername,
                    style: Styles.textStyleBold15(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    maxLines: 1,
                    '${notificationEntity.notificationMessageModel.localizationKey.tr()} ・ $notificationTimeAgo',
                    style: Styles.textStyleMedium12(context).copyWith(
                      color: context.secondaryTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
