import 'package:chefio_app/core/api/api_keys.dart';
import 'package:equatable/equatable.dart';

class LogInSuccessModel extends Equatable {
  final bool? success;
  final String accessToken;
  final String refreshToken;
  final String? message;

  const LogInSuccessModel(
      {this.success,
      required this.accessToken,
      required this.refreshToken,
      this.message});

  factory LogInSuccessModel.fromJson(Map<String, dynamic> json) {
    return LogInSuccessModel(
      success: json[ApiKeys.success] as bool?,
      accessToken: json[ApiKeys.accessToken] as String,
      message: json[ApiKeys.message] as String?,
      refreshToken: json[ApiKeys.refreshToken] as String,
    );
  }

  @override
  List<Object?> get props => [success, accessToken, message];
}
