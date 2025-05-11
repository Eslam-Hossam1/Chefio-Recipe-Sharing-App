import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:equatable/equatable.dart';

class ChefFollowingModel extends ChefConnectionEntity {
  final String id;
  final String username;
  final String profilePicture;
  final bool isFollowed;

  ChefFollowingModel({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.isFollowed,
  }) : super(
            chefId: id,
            chefUsername: username,
            chefProfilePicture: profilePicture,
            isFollowing: isFollowed);

  factory ChefFollowingModel.fromJson(Map<String, dynamic> json) {
    return ChefFollowingModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      profilePicture: json['profilePicture'] as String,
      isFollowed: json['isFollowed'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'profilePicture': profilePicture,
        'isFollowed': isFollowed,
      };

  @override
  List<Object?> get props => [id, username, profilePicture, isFollowed];
}
