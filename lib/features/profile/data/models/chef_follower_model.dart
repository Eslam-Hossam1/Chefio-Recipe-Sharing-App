import 'package:equatable/equatable.dart';

class ChefFollowerModel extends Equatable {
  final String id;
  final String username;
  final bool isFollowed;

  const ChefFollowerModel({
    required this.id,
    required this.username,
    required this.isFollowed,
  });

  factory ChefFollowerModel.fromJson(Map<String, dynamic> json) {
    return ChefFollowerModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      isFollowed: json['isFollowed'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'isFollowed': isFollowed,
      };

  @override
  List<Object?> get props => [id, username, isFollowed];
}
