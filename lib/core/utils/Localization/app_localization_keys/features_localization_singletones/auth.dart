class Auth {
  const Auth._();
  static const Auth instance = Auth._();
  //shared keys
  final String logout = 'auth.logout.logout_text';
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
  final String sessionExpired = 'auth.log_in.session_expired';
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

  final String signUpViewUsernameCantContainSpaces =
      'auth.sign_up.username_cant_contain_spaces';
  final String signUpViewUserNameMustBeBetween =
      'auth.sign_up.username_must_be_between';
  final String signUpViewUsernameCanOnlyContain =
      'auth.sign_up.username_can_only_contain';

  final String signUpViewWeakPassword = 'auth.sign_up.weak_password';

  final String signUpViewAtLeastCharacters = 'auth.sign_up.at_least_characters';
  final String signUpViewContainsUppercaseLetter =
      'auth.sign_up.must_contains_a_uppercase_letter';
  final String signUpViewContainsSpecialLetter =
      'auth.sign_up.must_contains_a_special_letter';
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

  final String verificationCodeViewVerificationCode =
      'auth.verification_code.verification_code';
  final String verificationCodeViewCheckYourEmail =
      'auth.verification_code.check_your_email';
  final String verificationCodeViewWeHaveSent =
      'auth.verification_code.we_have_sent_verification_code';
  final String verificationCodeViewCodeExpiresIn =
      'auth.verification_code.code_expires_in';
  final String verificationCodeViewVerify = 'auth.verification_code.verifiy';
  final String verificationCodeViewExitWarning =
      'auth.verification_code.verification_exit_warning';
  final String verificationCodeViewSendAgain =
      'auth.verification_code.send_again';
  final String verificationCodeViewSuccessMessage =
      'auth.verification_code.verification_success_message';
  final String verificationCodeViewPleaseEnterCompletePin =
      'auth.verification_code.pls_enter_complete_pin';

  final String resetPasswordViewResetYourPassword =
      'auth.reset_password.reset_your_password';
  final String resetPasswordViewPleaseEnterNewPassword =
      'auth.reset_password.please_enter_new_password';
  final String resetPasswordViewDone = 'auth.reset_password.done';
  final String resetPasswordExitWarning =
      'auth.reset_password.reset_password_exit_warning';
  final String resetPasswordViewSuccess =
      'auth.reset_password.reset_password_success';
}
