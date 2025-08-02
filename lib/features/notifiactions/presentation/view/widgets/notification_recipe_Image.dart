import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/routing/routing_helper.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/custom_cached_network_image.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NotificationRecipeImage extends StatelessWidget {
  const NotificationRecipeImage({
    super.key,
    required this.notitficationEntity,
  });
  final NotificationEntity notitficationEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          RoutingHelper.getRecipeDetailsPath(
            recipeId: notitficationEntity.recipeId!,
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        height: (64.w).clamp(58, 64 + (64 / 4)),
        width: (64.w).clamp(58, 64 + (64 / 4)),
        child: CustomCachedNetworkImage(
          url: notitficationEntity.recipePicture ?? Constants.nullUserImageUrl,
        ),
      ),
    );
  }
}
