import 'package:chefio_app/core/errors/api_error_model.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/error_codes.dart';
import 'package:chefio_app/core/errors/error_to_applocalization_key_mapper.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:dio/dio.dart';

class DioApiFailure extends ApiFailure {
  DioApiFailure(super.errMsg, super.appLocalizaitonKey, super.errCode);

  factory DioApiFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return DioApiFailure(
          "Connection timeout with ApiServer",
          AppLocalizationKeys.error.connectionTimeout,
          ErrorCodes.connectionTimeout,
        );
      case DioExceptionType.sendTimeout:
        return DioApiFailure(
          "Send timeout with ApiServer",
          AppLocalizationKeys.error.sendTimeout,
          ErrorCodes.sendTimeout,
        );

      case DioExceptionType.receiveTimeout:
        return DioApiFailure(
          "Receive timeout with ApiServer",
          AppLocalizationKeys.error.receiveTimeout,
          ErrorCodes.receiveTimeout,
        );

      case DioExceptionType.badCertificate:
        return DioApiFailure(
          "Bad Certificate ",
          AppLocalizationKeys.error.badCertificate,
          ErrorCodes.badCertificate,
        );

      case DioExceptionType.badResponse:
        return DioApiFailure.frombadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return DioApiFailure(
          "Request to ApiServer was canceld",
          AppLocalizationKeys.error.requestCancelled,
          ErrorCodes.requestCancelled,
        );
      case DioExceptionType.connectionError:
        return DioApiFailure(
          "No Internet Connection",
          AppLocalizationKeys.error.noInternetConnection,
          ErrorCodes.noInternetConnection,
        );
      case DioExceptionType.unknown:
        return DioApiFailure(
          "Unexpected Error, Please try again",
          AppLocalizationKeys.error.unknownError,
          ErrorCodes.unknownError,
        );
    }
  }
  factory DioApiFailure.frombadResponse(int status, dynamic responseBody) {
    if (responseBody != null && responseBody is Map<String, dynamic>) {
      ApiErrorModel apiErrorModel = ApiErrorModel.fromJson(responseBody);
      return DioApiFailure(
        apiErrorModel.message,
        ErrorLocalizationMapper.getLocalizationKey(apiErrorModel.errorCode),
        apiErrorModel.errorCode,
      );
    } else {
      return handleNoRersponseBodyError(status);
    }
  }

  static DioApiFailure handleNoRersponseBodyError(int status) {
    switch (status) {
      case 400:
        return DioApiFailure(
          'Bad Request',
          AppLocalizationKeys.error.badRequest,
          ErrorCodes.badRequest,
        );

      case 401:
        return DioApiFailure(
          'Unauthorized',
          AppLocalizationKeys.error.unauthorized,
          ErrorCodes.unauthorized,
        );

      case 403:
        return DioApiFailure(
          'Forbidden',
          AppLocalizationKeys.error.forbidden,
          ErrorCodes.forbidden,
        );

      case 404:
        return DioApiFailure(
          'Not Found',
          AppLocalizationKeys.error.notFound,
          ErrorCodes.notFound,
        );

      case 500:
        return DioApiFailure(
          'Internal Server Error',
          AppLocalizationKeys.error.internalServerError,
          ErrorCodes.internalServerError,
        );

      case 502:
        return DioApiFailure(
          'Bad Gateway',
          AppLocalizationKeys.error.badGateway,
          ErrorCodes.badGateway,
        );

      case 503:
        return DioApiFailure(
          'Service Unavailable',
          AppLocalizationKeys.error.serviceUnavailable,
          ErrorCodes.serviceUnavailable,
        );

      case 504:
        return DioApiFailure(
          'Gateway Timeout',
          AppLocalizationKeys.error.gatewayTimeout,
          ErrorCodes.gatewayTimeout,
        );

      default:
        return DioApiFailure(
          'Unknown Error',
          AppLocalizationKeys.error.unknownError,
          ErrorCodes.unknownError,
        );
    }
  }

  factory DioApiFailure.unknown(String errMsg) => DioApiFailure(
        errMsg,
        AppLocalizationKeys.error.unknownError,
        ErrorCodes.unknownError,
      );
}
