import 'package:equatable/equatable.dart';

import 'profile.dart';

class ProfileModel extends Equatable {
  final String id;
  final bool success;
  final String message;
  final Profile profile;

  const ProfileModel(
      {required this.id,required this.success, required this.message, required this.profile});

  factory ProfileModel.fromJson(Map<String, dynamic> json,String id) {
    return ProfileModel(
      id: id,
      success: json['success'] as bool,
      message: json['message'] as String,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'profile': profile.toJson(),
      };

  @override
  List<Object?> get props => [success, message, profile];
}
