import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String? profilePicture;

  const User({
    required this.id,
    required this.username,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'] as String,
        username: json['username'] as String,
        profilePicture: json['profilePicture'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'profilePicture': profilePicture,
      };

  @override
  List<Object?> get props => [id, username, profilePicture];
}
