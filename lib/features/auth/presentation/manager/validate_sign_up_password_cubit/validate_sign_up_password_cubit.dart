import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

part 'validate_sign_up_password_state.dart';

class ValidateSignUpPasswordCubit extends Cubit<ValidateSignUpPasswordState> {
  ValidateSignUpPasswordCubit() : super(ValidateSignUpPasswordInitial());
  bool isMinLengthValid = false;
  bool isContainsNumberValid = false;
  bool isContainsUppercaseLetter = false;
  bool isContainsLowercaseLetter = false;
  bool isContainsSpecialLetter = false;
  final RegExp eightCharRegex = RegExp(r'^.{8,}$');

  final RegExp numberRegex = RegExp(r'\d');

  final RegExp uppercaseRegex = RegExp(r'[A-Z]');

  final RegExp lowercaseRegex = RegExp(r'[a-z]');

  final RegExp specialLetterRegex = RegExp(r'[@$!^%*?#&]');

  void validatePasswordOnChange(String password) {
    isMinLengthValid = eightCharRegex.hasMatch(password);
    isContainsNumberValid = numberRegex.hasMatch(password);
    isContainsUppercaseLetter = uppercaseRegex.hasMatch(password);
    isContainsSpecialLetter = specialLetterRegex.hasMatch(password);
    isContainsLowercaseLetter = lowercaseRegex.hasMatch(password);
    emit(ValidateSignUpPasswordUpdate());
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

  bool validateContainsSpecialLetter({required String password}) {
    bool isContainsSpecialLetter = specialLetterRegex.hasMatch(password);
    return isContainsSpecialLetter;
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
    } else if (!validateContainsSpecialLetter(password: password)) {
      return AppLocalizationKeys.auth.signUpViewContainsSpecialLetter.tr();
    } else if (!validateContainsLowercaseLetter(password: password)) {
      return AppLocalizationKeys.auth.signUpViewContainsLowercaseLetter.tr();
    } else {
      null;
    }
  }
}
