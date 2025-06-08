class NotificationModel {
  final String chefId;
  final String chefProfilePicture;
  final String username;
  final String message;
  final DateTime createdFrom;
  final String type; //like,follow-you,following-uploaded-recipe
  final String? recipePicture;
  final String? recipeId;
  bool? isFollowing;

  NotificationModel({
    required this.chefId,
    required this.chefProfilePicture,
    required this.username,
    required this.message,
    required this.createdFrom,
    required this.type,
    required this.recipePicture,
    required this.recipeId,
    this.isFollowing,
  });
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      chefId: json['chefId'] ?? '',
      chefProfilePicture: json['chefProfilePicture'] ?? '',
      username: json['username'] ?? '',
      message: json['message'] ?? '',
      createdFrom: DateTime.parse(json['createdFrom']),
      type: json['type'] ?? '',
      recipePicture: json['recipePicture'],
      recipeId: json['recipeId'],
      isFollowing: json['isFollowing'],
    );
  }
}
