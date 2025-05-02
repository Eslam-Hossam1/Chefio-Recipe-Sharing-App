import 'package:equatable/equatable.dart';

class ChefFollowingModel extends Equatable {
  final String id;
  final String username;
  final String profilePicture;
  final bool isFollowed;

  const ChefFollowingModel({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.isFollowed,
  });

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
