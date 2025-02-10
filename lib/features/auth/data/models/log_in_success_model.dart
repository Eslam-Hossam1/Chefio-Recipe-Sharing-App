import 'package:equatable/equatable.dart';

class LogInSuccessModel extends Equatable {
  final bool? success;
  final String token;
  final String? message;

  const LogInSuccessModel({this.success,required this.token, this.message});

  factory LogInSuccessModel.fromJson(Map<String, dynamic> json) {
    return LogInSuccessModel(
      success: json['success'] as bool?,
      token: json['token'] as String,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'token': token,
        'message': message,
      };

  @override
  List<Object?> get props => [success, token, message];
}
