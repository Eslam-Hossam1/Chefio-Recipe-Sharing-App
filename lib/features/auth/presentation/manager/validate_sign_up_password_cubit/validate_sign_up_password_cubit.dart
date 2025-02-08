import 'package:bloc/bloc.dart';
import 'package:chefio_app/core/utils/app_localization_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';

part 'validate_sign_up_password_state.dart';

class ValidateSignUpPasswordCubit extends Cubit<ValidateSignUpPasswordState> {
  ValidateSignUpPasswordCubit() : super(ValidateSignUpPasswordInitial());
  bool isMinLengthValid = false;
  bool isContainsNumberValid = false;

  final RegExp eightCharRegex = RegExp(r'^.{8,}$');

  final RegExp numberRegex = RegExp(r'\d');

  void validatePasswordOnChange({required String password}) {
    isMinLengthValid = eightCharRegex.hasMatch(password);
    isContainsNumberValid = numberRegex.hasMatch(password);

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

  String? passwordTextFieldValidator(String? password) {
    if (password == null || password.isEmpty) {
      return AppLocalizationKeys.auth.thisFieldRequired.tr();
    } else if (!validateAtLeastSixChar(password: password)) {
      return AppLocalizationKeys.auth.signUpViewAtLeastCharacters.tr();
    } else if (!validateContainsNumber(password: password)) {
      return AppLocalizationKeys.auth.signUpViewMustContainNumber.tr();
    } else {
      return null;
    }
  }
}
