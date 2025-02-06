abstract class AppLocalizationKeys {
  static OnBoarding onBoarding = OnBoarding._instance;
  static Auth auth = Auth._instance;
  static ProfileSetup profileSetup = ProfileSetup._instance;
  static Global global = Global._instance;
}

class OnBoarding {
  OnBoarding._();
  static final OnBoarding _instance = OnBoarding._();
  final String title = 'onboarding.title';
  final String body = 'onboarding.body';
  final String buttonText = 'onboarding.button_text';
}

class Auth {
  Auth._();
  static final Auth _instance = Auth._();
  //shared keys
  final String enterAccount = 'auth.shared.enter_account';
  final String usernameTextFeildHint = 'auth.shared.username_text_field_hint';
  final String emailTextFeildHint = 'auth.shared.email_text_field_hint';
  final String passwordTextFieldHint = 'auth.shared.password_text_field_hint';
  final String forgetPasswordQuestion = 'auth.shared.forget_password_question';
  final String logIn = 'auth.shared.log_in';
  final String signup = 'auth.shared.sign_up';
  final String orContinueWith = 'auth.shared.or_continue_with';
  final String confirm = 'auth.shared.confirm';
  final String thisFieldRequired = 'auth.shared.this_field_required';
  final String unknownError = 'auth.shared.unknown_error';
  final String invalidEmail = 'auth.shared.invalid_email';
  final String userNotFound = 'auth.shared.user_not_found';
  final String invalidRecipientEmail = 'auth.shared.invalid_recipient_email';
  final String tooManyRequests = 'auth.shared.too_many_requests';
  final String networkRequestFailed = 'auth.shared.network_request_failed';

  //view related keys
  final String logInViewWelcomeBack = 'auth.log_in.welcome_back';
  final String logInViewDontHaveAnAccount = 'auth.log_in.do_not_have_account';
  final String logInViewWrongPassword = 'auth.log_in.wrong_password';
  final String logInViewUserDisabled = 'auth.log_in.user_disabled';
  final String logInViewYourEmailNotVerifiedYet =
      'auth.log_in.your_email_need_to_verified';
  final String signUpViewWelcome = 'auth.sign_up.welcome';
  final String signUpViewWeSentEmailVerification =
      'auth.sign_up.we_sent_email_verification';
  final String signUpViewYourPasswordMustContain =
      'auth.sign_up.your_password_must_contain';
  final String signUpViewEmailAlreadyInUse =
      'auth.sign_up.email_already_in_use';
  final String signUpViewOperationNotAllowed =
      'auth.sign_up.operation_not_allowed';

  final String signUpViewWeakPassword = 'auth.sign_up.weak_password';

  final String signUpViewAtLeastCharacters = 'auth.sign_up.at_least_characters';
  final String signUpViewContainsUppercaseLetter =
      'auth.sign_up.must_contains_a_uppercase_letter';
  final String signUpViewContainsLowercaseLetter =
      'auth.sign_up.must_contains_a_lowercase_letter';
  final String signUpViewMustContainNumber =
      'auth.sign_up.must_contains_a_number';
  final String signUpViewAlreadyHaveAnAccount =
      'auth.sign_up.already_have_an_account';
  final String forgetPasswordViewPasswordRecovery =
      'auth.forget_password.password_recovery';
  final String forgetPasswordViewEnterEmailRecoverPassword =
      'auth.forget_password.enter_email_recover_password';
  final String forgetPasswordViewPasswordResetLinkSent =
      'auth.forget_password.password_reset_link_sent';

  final String verificationCodeViewVerificationCode = 'auth.verification_code.verification_code';
  final String verificationCodeViewCheckYourEmail = 'auth.verification_code.check_your_email';
  final String verificationCodeViewWeHaveSent = 'auth.verification_code.we_have_sent_verification_code';
  final String verificationCodeViewCodeExpiresIn = 'auth.verification_code.code_expires_in';
  final String verificationCodeViewVerify = 'auth.verification_code.verifiy';
  final String verificationCodeViewSendAgain = 'auth.verification_code.send_again';

  final String resetPasswordViewResetYourPassword = 'auth.reset_password.reset_your_password';
  final String resetPasswordViewPleaseEnterNewPassword = 'auth.reset_password.please_enter_new_password';
  final String resetPasswordViewDone = 'auth.reset_password.done';

}

class ProfileSetup {
  ProfileSetup._();
  static final ProfileSetup _instance = ProfileSetup._();
  final String completeYourProfile = 'profile_setup.complete_profile';
  final String uploadProfilePicture = 'profile_setup.upload_profile_picture';
  final String chooseUsername = 'profile_setup.choose_username';
  final String usernameTextFieldHint = 'profile_setup.username_placeholder';
  final String usernameEmptyError = 'profile_setup.username_empty_error';
  final String completeProfileButtonText =
      'profile_setup.complete_profile_button';
  final String profilePictureOptional =
      'profile_setup.profile_picture_optional';
  final String savingProfileError = 'profile_setup.saving_profile_error';
  final String savingProfileSuccess = 'profile_setup.saving_profile_success';
}

class Global {
  Global._();
  static final Global _instance = Global._();
  final String warning = 'global.warning';
  final String error = 'global.error';
  final String info = 'global.info';
  final String success = 'global.success';
}
