import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String? id;
  final String? username;

  const Profile({this.id, this.username});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['_id'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
      };

  @override
  List<Object?> get props => [id, username];
}
