import 'package:equatable/equatable.dart';

class ApiErrorModel extends Equatable {
  final bool success;
  final String message;
  final String errorCode;

  const ApiErrorModel({
    required this.success,
    required this.message,
    required this.errorCode,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        success: json['success'] as bool,
        message: json['message'] as String,
        errorCode: json['error'] as String,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'error': errorCode,
      };

  @override
  List<Object?> get props => [success, message, errorCode];
}
