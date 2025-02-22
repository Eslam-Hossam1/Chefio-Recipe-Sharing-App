
import 'package:chefio_app/core/utils/app_localization_keys.dart';

String getLocalizationKeyFromErrorCode(String errorKey) {
   Map<String, String> errorMap = {
    "bad_request": AppLocalizationKeys.error.badRequest,
    "unauthorized": AppLocalizationKeys.error.unauthorized,
    "forbidden": AppLocalizationKeys.error.forbidden,
    "not_found": AppLocalizationKeys.error.notFound,
    "conflict": AppLocalizationKeys.error.conflict,
    "unprocessable_entity": AppLocalizationKeys.error.unprocessableEntity,
    "internal_server_error": AppLocalizationKeys.error.internalServerError,
    "service_unavailable": AppLocalizationKeys.error.serviceUnavailable,
    "unknown_error": AppLocalizationKeys.error.unknownError,
    "expired_token": AppLocalizationKeys.error.expiredToken,
    "invalid_credentials": AppLocalizationKeys.error.invalidCredentials,
    "account_locked": AppLocalizationKeys.error.accountLocked,
    "email_not_verified": AppLocalizationKeys.error.emailNotVerified,
    "insufficient_funds": AppLocalizationKeys.error.insufficientFunds,
    "payment_declined": AppLocalizationKeys.error.paymentDeclined,
    "invalid_card_details": AppLocalizationKeys.error.invalidCardDetails,
    "duplicate_entry": AppLocalizationKeys.error.duplicateEntry,
    "data_conflict": AppLocalizationKeys.error.dataConflict,
    "record_not_found": AppLocalizationKeys.error.recordNotFound,
    "invalid_input": AppLocalizationKeys.error.invalidInput,
    "file_too_large": AppLocalizationKeys.error.fileTooLarge,
    "unsupported_file_format": AppLocalizationKeys.error.unsupportedFileFormat,
    "storage_full": AppLocalizationKeys.error.storageFull,
    "permission_denied": AppLocalizationKeys.error.permissionDenied,
    "device_not_supported": AppLocalizationKeys.error.deviceNotSupported,
    "connection_timeout": AppLocalizationKeys.error.connectionTimeout,
    "send_timeout": AppLocalizationKeys.error.sendTimeout,
    "receive_timeout": AppLocalizationKeys.error.receiveTimeout,
    "bad_certificate": AppLocalizationKeys.error.badCertificate,
    "bad_response": AppLocalizationKeys.error.badResponse,
    "request_cancelled": AppLocalizationKeys.error.requestCancelled,
    "no_internet_connection": AppLocalizationKeys.error.noInternetConnection,
    "validation_error": AppLocalizationKeys.error.validationError,
    "invalid_code": AppLocalizationKeys.error.invalidCode,
  };

  return errorMap[errorKey] ?? AppLocalizationKeys.error.unknownError;
}