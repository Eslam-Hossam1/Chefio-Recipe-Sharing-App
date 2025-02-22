import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/errors/error_codes.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/api_response_error.dart';
import 'package:chefio_app/core/errors/error_to_applocalization_key_parser.dart';
import 'package:chefio_app/core/errors/failures.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:dio/dio.dart';

class DioApiFailure extends ApiFailure {
  DioApiFailure(super.errMsg, super.appLocalizaitonKey, super.errCode);

  factory DioApiFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return DioApiFailure(
            "Connection timeout with ApiServer",
            AppLocalizationKeys.error.connectionTimeout,
            ErrorCodes.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return DioApiFailure("Send timeout with ApiServer",
            AppLocalizationKeys.error.sendTimeout, ErrorCodes.sendTimeout);

      case DioExceptionType.receiveTimeout:
        return DioApiFailure(
            "Receive timeout with ApiServer",
            AppLocalizationKeys.error.receiveTimeout,
            ErrorCodes.receiveTimeout);

      case DioExceptionType.badCertificate:
        return DioApiFailure(
            "Bad Certificate ",
            AppLocalizationKeys.error.badCertificate,
            ErrorCodes.badCertificate);

      case DioExceptionType.badResponse:
        return DioApiFailure.frombadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return DioApiFailure(
            "Request to ApiServer was canceld",
            AppLocalizationKeys.error.requestCancelled,
            ErrorCodes.requestCancelled);
      case DioExceptionType.connectionError:
        return DioApiFailure(
            "No Internet Connection",
            AppLocalizationKeys.error.noInternetConnection,
            ErrorCodes.noInternetConnection);
      case DioExceptionType.unknown:
        return DioApiFailure("Unexpected Error, Please try again",
            AppLocalizationKeys.error.unknownError, ErrorCodes.unknownError);
      default:
        return DioApiFailure("Opps there was an error, Please try again later",
            AppLocalizationKeys.error.unknownError, ErrorCodes.unknownError);
    }
  }
  factory DioApiFailure.frombadResponse(int status, dynamic responseBody) {
    String appLocalizationKey =
        getLocalizationKeyFromErrorCode(responseBody[ApiKeys.error]);

    switch (status) {
      case 400:
        return DioApiFailure(
            responseBody["message"], appLocalizationKey, ErrorCodes.badRequest);

      case 401:
        return DioApiFailure(responseBody["message"], appLocalizationKey,
            ErrorCodes.unauthorized);

      case 403:
        return DioApiFailure(
            responseBody["message"], appLocalizationKey, ErrorCodes.forbidden);

      case 404:
        return DioApiFailure(
            responseBody["message"] ??
                "Your request not found, Please try later!",
            appLocalizationKey,
            ErrorCodes.notFound);

      case 500:
        return DioApiFailure("Internal server error, Please try later",
            appLocalizationKey, ErrorCodes.internalServerError);

      default:
        return DioApiFailure("Oops there was an error, Please try again",
            appLocalizationKey, ErrorCodes.unknownError);
    }
  }
  factory DioApiFailure.unknown(String errMsg) => DioApiFailure(
      errMsg, AppLocalizationKeys.error.unknownError, ErrorCodes.unknownError);
}
