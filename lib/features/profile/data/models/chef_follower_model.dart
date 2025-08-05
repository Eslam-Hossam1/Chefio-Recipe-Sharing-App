import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';

class ChefFollowerModel extends ChefConnectionEntity {
  final String id;
  final String username;
  final bool isFollowed;
  final String? profilePicture;

  ChefFollowerModel({
    required this.id,
    required this.username,
    required this.isFollowed,
    required this.profilePicture,
  }) : super(
          chefId: id,
          chefUsername: username,
          chefProfilePicture: profilePicture,
          isFollowing: isFollowed,
        );

  factory ChefFollowerModel.fromJson(Map<String, dynamic> json) {
    return ChefFollowerModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      profilePicture: json['profilePicture'] as String?,
      isFollowed: json['isFollowed'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'isFollowed': isFollowed,
        'profilePicture': profilePicture,
      };

  List<Object?> get props => [id, username, isFollowed];
}
