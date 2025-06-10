class MyNotificationDataModel {
  String senderName;
  String senderId;
  String senderProfilePicture;
  String type;
  String? clickAction;
  String? recipeId;

  MyNotificationDataModel({
    required this.senderName,
    required this.senderId,
    required this.senderProfilePicture,
    required this.type,
    this.clickAction,
    this.recipeId,
  });

  factory MyNotificationDataModel.fromJson(Map<String, dynamic> json) {
    return MyNotificationDataModel(
      senderName: json['senderName'] as String,
      senderId: json['senderId'] as String,
      senderProfilePicture: json['senderProfilePicture'] as String,
      type: json['type'] as String,
      clickAction: json['click_action'] as String?,
      recipeId: json['recipeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'senderName': senderName,
        'senderId': senderId,
        'senderProfilePicture': senderProfilePicture,
        'type': type,
        'click_action': clickAction,
        'recipeId': recipeId,
      };
}
