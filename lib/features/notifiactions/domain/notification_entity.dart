import 'package:chefio_app/features/notifiactions/data/models/notification_message_model.dart';

class NotificationEntity {
  final String notificationId;
  final String chefId;
  final String? chefProfilePicture;
  final String chefUsername;
  final NotificationMessageModel notificationMessageModel;
  final DateTime createdAt;
  final String type;
  final String? recipePicture;
  final String? recipeId;
  bool? isFollowing;

  NotificationEntity({
    required this.notificationId,
    required this.chefId,
    required this.chefProfilePicture,
    required this.chefUsername,
    required this.notificationMessageModel,
    required this.createdAt,
    required this.type,
    required this.recipePicture,
    required this.recipeId,
    this.isFollowing,
  });
}
