import 'package:chefio_app/features/notifiactions/data/models/notification_message_model.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';

import 'sender.dart';

class NotificationModel extends NotificationEntity {
  String id;
  String receiver;
  Sender sender;
  String notifcationtype;
  String? notificationRecipeId;
  String? notitifcationRecipePicture;
  bool isRead;
  DateTime notificationCreatedAt;
  bool? isFollowed;
  int? v;

  NotificationModel({
    required this.id,
    required this.receiver,
    required this.sender,
    required this.notifcationtype,
    this.notificationRecipeId,
    required this.isRead,
    this.notitifcationRecipePicture,
    required this.notificationCreatedAt,
    this.isFollowed,
    this.v,
  }) : super(
            notificationId: id,
            chefId: sender.id!,
            chefProfilePicture: sender.profilePicuture,
            chefUsername: sender.username,
            notificationMessageModel:
                NotificationMessageModel.fromType(type: notifcationtype),
            createdAt: notificationCreatedAt,
            type: notifcationtype,
            isFollowing: isFollowed,
            recipePicture: notitifcationRecipePicture,
            recipeId: notificationRecipeId);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] as String,
      receiver: json['receiver'] as String,
      sender: Sender.fromJson(json['sender'] as Map<String, dynamic>),
      notifcationtype: json['type'] as String,
      notificationRecipeId: json['recipeId'] as String?,
      isRead: json['isRead'] as bool,
      notificationCreatedAt: DateTime.parse(json['createdAt'] as String),
      v: json['__v'] as int?,
      notitifcationRecipePicture: json['recipePicture'] as String?,
      isFollowed: json['isFollowed'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'receiver': receiver,
        'sender': sender.toJson(),
        'type': notifcationtype,
        'recipeId': notificationRecipeId,
        'recipePicture': recipePicture,
        'isRead': isRead,
        'createdAt': notificationCreatedAt.toIso8601String(),
        'isFollowed': isFollowed,
        '__v': v,
      };
}
