import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/data/models/following_state.dart';

class ChefFollowerModel extends ChefConnectionEntity {
  final String id;
  final String username;
  final FollowingState isFollowed;
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
          isFollowing: isFollowed == FollowingState.following,
        );

  factory ChefFollowerModel.fromJson(Map<String, dynamic> json) {
    return ChefFollowerModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      profilePicture: json['profilePicture'] as String?,
      isFollowed: FollowingState.fromJson(json['isFollowed'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'isFollowed': isFollowed.toJson(),
        'profilePicture': profilePicture,
      };

  List<Object?> get props => [id, username, isFollowed];
}
