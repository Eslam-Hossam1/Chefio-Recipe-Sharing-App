import 'package:equatable/equatable.dart';

import 'initial_recipes.dart';

class Profile extends Equatable {
  final String? username;
  final String? email;
  final String? profilePicture;
  final int? followersCount;
  final int? followingCount;
  final String? isFollowing;
  final InitialRecipes? recipes;

  const Profile({
    this.username,
    this.email,
    this.profilePicture,
    this.followersCount,
    this.followingCount,
    this.isFollowing,
    this.recipes,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        username: json['username'] as String?,
        email: json['email'] as String?,
        profilePicture: json['profilePicture'] as String?,
        followersCount: json['followersCount'] as int?,
        followingCount: json['followingCount'] as int?,
        isFollowing: json['isFollowing'] as String?,
        recipes: json['recipes'] == null
            ? null
            : InitialRecipes.fromJson(json['recipes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'profilePicture': profilePicture,
        'followersCount': followersCount,
        'followingCount': followingCount,
        'isFollowing': isFollowing,
        'recipes': recipes?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      username,
      email,
      profilePicture,
      followersCount,
      followingCount,
      isFollowing,
      recipes,
    ];
  }
}
