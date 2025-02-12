import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

part 'validate_reset_password_state.dart';

class ValidateResetPasswordCubit extends Cubit<ValidateResetPasswordState> {
  ValidateResetPasswordCubit() : super(ValidateResetPasswordInitial());
  bool isMinLengthValid = false;
  bool isContainsNumberValid = false;
  bool isContainsUppercaseLetter = false;
  bool isContainsLowercaseLetter = false;
  final RegExp eightCharRegex = RegExp(r'^.{8,}$');

  final RegExp numberRegex = RegExp(r'\d');

  final RegExp uppercaseRegex = RegExp(r'[A-Z]');

  final RegExp lowercaseRegex = RegExp(r'[a-z]');

  void validatePasswordOnChange(String password) {
    isMinLengthValid = eightCharRegex.hasMatch(password);
    isContainsNumberValid = numberRegex.hasMatch(password);
    isContainsUppercaseLetter = uppercaseRegex.hasMatch(password);
    isContainsLowercaseLetter = lowercaseRegex.hasMatch(password);
    emit(ValidateResetPasswordUpdate());
  }

  bool validateAtLeastSixChar({required String password}) {
    bool isMinLengthValid = eightCharRegex.hasMatch(password);
    return isMinLengthValid;
  }

  bool validateContainsNumber({required String password}) {
    bool isContainsNumberValid = numberRegex.hasMatch(password);
    return isContainsNumberValid;
  }

  bool validateContainsUppercaseLetter({required String password}) {
    bool isContainsUppercaseLetter = uppercaseRegex.hasMatch(password);
    return isContainsUppercaseLetter;
  }

  bool validateContainsLowercaseLetter({required String password}) {
    bool isContainsLowercaseLetter = lowercaseRegex.hasMatch(password);
    return isContainsLowercaseLetter;
  }

  String? passwordTextFieldValidator(String? password) {
    if (password == null || password.isEmpty) {
      return AppLocalizationKeys.auth.thisFieldRequired.tr();
    } else if (!validateAtLeastSixChar(password: password)) {
      return AppLocalizationKeys.auth.signUpViewAtLeastCharacters.tr();
    } else if (!validateContainsNumber(password: password)) {
      return AppLocalizationKeys.auth.signUpViewMustContainNumber.tr();
    } else if (!validateContainsUppercaseLetter(password: password)) {
      return AppLocalizationKeys.auth.signUpViewContainsUppercaseLetter.tr();
    } else if (!validateContainsLowercaseLetter(password: password)) {
      return AppLocalizationKeys.auth.signUpViewContainsLowercaseLetter.tr();
    } else {
      null;
    }
  }
}
