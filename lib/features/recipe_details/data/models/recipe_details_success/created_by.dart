import 'package:equatable/equatable.dart';

class CreatedBy extends Equatable {
  final String id;
  final String username;
  final String? profilePicture;

  const CreatedBy(
      {required this.id, required this.username, this.profilePicture});

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
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
