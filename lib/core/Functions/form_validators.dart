import 'dart:developer';

import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class FormValidators {
  static String? customTextFormFieldValidator(String? value) {
    if (isValueEmpty(value)) {
      return AppLocalizationKeys.auth.thisFieldRequired.tr();
    } else {
      return null;
    }
  }

  static String? requiredNumberOfCharacters(String? value, int number) {
    if (value == null || value.length < number) {
      return 'This field require at least $number of characters';
    } else {
      return null;
    }
  }

  static String? usernameTextFormFieldValidator(String? value) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (isValueEmpty(value)) {
      return AppLocalizationKeys.auth.thisFieldRequired.tr();
    } else if (value!.contains(' ')) {
      return AppLocalizationKeys.auth.signUpViewUsernameCantContainSpaces.tr();
    } else if (value.length < 2 || value.length > 20) {
      return AppLocalizationKeys.auth.signUpViewUserNameMustBeBetween.tr();
    } else if (!usernameRegex.hasMatch(value)) {
      return AppLocalizationKeys.auth.signUpViewUsernameCanOnlyContain.tr();
    } else {
      return null;
    }
  }

  static String? emailTextFormFieldValidator(String? value) {
    if (isValueEmpty(value)) {
      return AppLocalizationKeys.auth.thisFieldRequired.tr();
    } else if (!isValidEmail(value!)) {
      return AppLocalizationKeys.auth.invalidEmail.tr();
    } else {
      return null;
    }
  }

  static String? pincodeTextFormFieldValidator(String? value) {
    if (isValueEmpty(value) || value!.length < 6) {
      return AppLocalizationKeys.auth.verificationCodeViewPleaseEnterCompletePin
          .tr();
    } else {
      return null;
    }
  }

  static bool isValueEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r"^(?!.*\.\.)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(email);
  }
}
