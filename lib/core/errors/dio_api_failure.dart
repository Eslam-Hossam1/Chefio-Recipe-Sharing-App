import 'package:chefio_app/core/errors/failures.dart';
import 'package:dio/dio.dart';

class DioApiFailure extends Failure {
  DioApiFailure(super.errMsg);
  factory DioApiFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return DioApiFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return DioApiFailure("Send timeout with ApiServer");

      case DioExceptionType.receiveTimeout:
        return DioApiFailure("Receive timeout with ApiServer");

      case DioExceptionType.badCertificate:
        return DioApiFailure("Bad Certificate ");

      case DioExceptionType.badResponse:
        return DioApiFailure.frombadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return DioApiFailure("Request to ApiServer was canceld");
      case DioExceptionType.connectionError:
        return DioApiFailure("No Internet Connection");
      case DioExceptionType.unknown:
        return DioApiFailure("Unexpected Error, Please try again");
      default:
        return DioApiFailure("Opps there was an error, Please try again later");
    }
  }
  factory DioApiFailure.frombadResponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return DioApiFailure(response["message"]);
    } else if (status == 404) {
      return response['message'] == null
          ? DioApiFailure("Your request not found, Please try later!")
          : DioApiFailure(response["message"]);
    } else if (status == 500) {
      return DioApiFailure("Internal server error, Please try later");
    } else {
      return DioApiFailure("Opps there was an error, Please try again ");
    }
  }
}
