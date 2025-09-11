import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/data/models/following_state.dart';

class ChefFollowingModel extends ChefConnectionEntity {
  final String id;
  final String username;
  final String? profilePicture;
  final FollowingState isFollowed;

  ChefFollowingModel({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.isFollowed,
  }) : super(
            chefId: id,
            chefUsername: username,
            chefProfilePicture: profilePicture,
            isFollowing: isFollowed == FollowingState.following);

  factory ChefFollowingModel.fromJson(Map<String, dynamic> json) {
    return ChefFollowingModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      profilePicture: json['profilePicture'] as String?,
      isFollowed: FollowingState.fromJson(json['isFollowed'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'profilePicture': profilePicture,
        'isFollowed': isFollowed.toJson(),
      };

  List<Object?> get props => [id, username, profilePicture, isFollowed];
}
