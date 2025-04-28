import 'package:equatable/equatable.dart';

import 'user.dart';

class RecipeLikerModel extends Equatable {
  final String id;
  final User user;
  final String? recipe;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const RecipeLikerModel({
   required this.id,
   required this.user,
    this.recipe,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RecipeLikerModel.fromJson(Map<String, dynamic> json) {
    return RecipeLikerModel(
      id: json['_id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      recipe: json['recipe'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user.toJson(),
        'recipe': recipe,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  List<Object?> get props => [id, user, recipe, createdAt, updatedAt, v];
}
