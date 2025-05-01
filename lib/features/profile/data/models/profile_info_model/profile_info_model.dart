import 'package:equatable/equatable.dart';

import 'profile.dart';

class ProfileInfoModel extends Equatable {
  final bool? success;
  final String? message;
  final Profile? profile;

  const ProfileInfoModel({this.success, this.message, this.profile});

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfoModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'profile': profile?.toJson(),
      };

  @override
  List<Object?> get props => [success, message, profile];
}
