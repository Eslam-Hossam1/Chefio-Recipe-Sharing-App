import 'package:collection/collection.dart';

import 'result.dart';

class SignUpSuccessModel {
  bool? success;
  String? message;
  Result? result;

  SignUpSuccessModel({this.success, this.message, this.result});

  factory SignUpSuccessModel.fromJson(Map<String, dynamic> json) =>
      SignUpSuccessModel(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        result: json['result'] == null
            ? null
            : Result.fromJson(json['result'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'result': result?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SignUpSuccessModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ result.hashCode;
}
