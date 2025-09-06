import 'package:chefio_app/core/Localization/app_localization_keys/app_localization_keys.dart';
import 'error_codes.dart';

abstract class ErrorLocalizationMapper {
  static final Map<String, String> _errorMap = {
    ErrorCodes.badRequest: AppLocalizationKeys.error.badRequest,
    ErrorCodes.unauthorized: AppLocalizationKeys.error.unauthorized,
    ErrorCodes.forbidden: AppLocalizationKeys.error.forbidden,
    ErrorCodes.notFound: AppLocalizationKeys.error.notFound,
    ErrorCodes.conflict: AppLocalizationKeys.error.conflict,
    ErrorCodes.unprocessableEntity:
        AppLocalizationKeys.error.unprocessableEntity,
    ErrorCodes.internalServerError:
        AppLocalizationKeys.error.internalServerError,
    ErrorCodes.serverError:
        AppLocalizationKeys.error.internalServerError,
    ErrorCodes.serviceUnavailable: AppLocalizationKeys.error.serviceUnavailable,
    ErrorCodes.unknownError: AppLocalizationKeys.error.unknownError,
    ErrorCodes.expiredToken: AppLocalizationKeys.error.expiredToken,
    ErrorCodes.invalidCredentials: AppLocalizationKeys.error.invalidCredentials,
    ErrorCodes.accountLocked: AppLocalizationKeys.error.accountLocked,
    ErrorCodes.emailNotVerified: AppLocalizationKeys.error.emailNotVerified,
    ErrorCodes.insufficientFunds: AppLocalizationKeys.error.insufficientFunds,
    ErrorCodes.paymentDeclined: AppLocalizationKeys.error.paymentDeclined,
    ErrorCodes.invalidCardDetails: AppLocalizationKeys.error.invalidCardDetails,
    ErrorCodes.duplicateEntry: AppLocalizationKeys.error.duplicateEntry,
    ErrorCodes.dataConflict: AppLocalizationKeys.error.dataConflict,
    ErrorCodes.recordNotFound: AppLocalizationKeys.error.recordNotFound,
    ErrorCodes.invalidInput: AppLocalizationKeys.error.invalidInput,
    ErrorCodes.fileTooLarge: AppLocalizationKeys.error.fileTooLarge,
    ErrorCodes.unsupportedFileFormat:
        AppLocalizationKeys.error.unsupportedFileFormat,
    ErrorCodes.storageFull: AppLocalizationKeys.error.storageFull,
    ErrorCodes.permissionDenied: AppLocalizationKeys.error.permissionDenied,
    ErrorCodes.deviceNotSupported: AppLocalizationKeys.error.deviceNotSupported,
    ErrorCodes.connectionTimeout: AppLocalizationKeys.error.connectionTimeout,
    ErrorCodes.sendTimeout: AppLocalizationKeys.error.sendTimeout,
    ErrorCodes.receiveTimeout: AppLocalizationKeys.error.receiveTimeout,
    ErrorCodes.badCertificate: AppLocalizationKeys.error.badCertificate,
    ErrorCodes.badResponse: AppLocalizationKeys.error.badResponse,
    ErrorCodes.requestCancelled: AppLocalizationKeys.error.requestCancelled,
    ErrorCodes.noInternetConnection:
        AppLocalizationKeys.error.noInternetConnection,
    ErrorCodes.validationError: AppLocalizationKeys.error.validationError,
    ErrorCodes.badGateway: AppLocalizationKeys.error.badGateway,
    ErrorCodes.gatewayTimeout: AppLocalizationKeys.error.gatewayTimeout,
  };

  static String getLocalizationKey(String errorKey) {
    return _errorMap[errorKey] ?? AppLocalizationKeys.error.unknownError;
  }
}
