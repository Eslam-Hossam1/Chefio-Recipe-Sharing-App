abstract class AppLocalizationKeys {
  static OnBoarding onBoarding = OnBoarding._instance;
  static Auth auth = Auth._instance;
  static ProfileSetup profileSetup = ProfileSetup._instance;
  static Global global = Global._instance;
  static Error error = Error._instance;
  static Upload upload = Upload._instance;
  static LocalizationCategory category = LocalizationCategory._instance;
  static RecipeDetails recipeDetails = RecipeDetails._instance;
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

class Upload {
  Upload._();
  static final Upload _instance = Upload._();
  final String addCoverPhoto = 'upload.add_cover_photo';
  final String foodName = 'upload.food_name';
  final String upTo = 'upload.up_to';
  final String enterFoodName = 'upload.enter_food_Name';
  final String description = 'upload.description';
  final String descriptionHint = 'upload.tell_a_little_about_your_food';
  final String cookingDuration = 'upload.cooking_duration';
  final String inMinutes = 'upload.in_minutes';
  final String enterIngredient = 'upload.enter_ingredient';
  final String addIngredient = 'upload.add_ingredient';
  final String addStep = 'upload.add_step';
  final String stepHint = 'upload.step_hint';
}

class Global {
  Global._();
  static final Global _instance = Global._();
  final String warning = 'global.warning';
  final String error = 'global.error';
  final String info = 'global.info';
  final String success = 'global.success';
  final String exit = 'global.exit';
  final String stay = 'global.stay';
  final String search = 'global.search';
  final String all = 'global.all';
  final String food = 'global.food';
  final String drink = 'global.drink';
  final String home = 'global.home';
  final String upload = 'global.upload';
  final String notification = 'global.notification';
  final String profile = 'global.profile';
  final String category = 'global.category';
  final String cancel = 'global.cancel';
  final String next = 'global.next';
  final String ingredients = 'global.ingredients';
  final String steps = 'global.steps';
  final String back = 'global.back';
  final String mins = 'global.mins';
  final String likes = 'global.likes';
}

class LocalizationCategory {
  LocalizationCategory._();
  static final LocalizationCategory _instance = LocalizationCategory._();
  final String generalDishes = 'category.general_dishes';
  final String mainDishes = 'category.main_dishes';
  final String fastFood = 'category.fast_food';
  final String healthyMeals = 'category.healthy_meals';
  final String dessertsAndBakery = 'category.desserts_and_bakery';
}

class RecipeDetails {
  RecipeDetails._();
  static final RecipeDetails _instance = RecipeDetails._();
  final String shareRecipe = 'recipe_details.share_recipe';
  final String editRecipe = 'recipe_details.edit_recipe';
}

class Error {
  Error._();
  static final Error _instance = Error._();
  final String badRequest = "errors.bad_request";
  final String unauthorized = "errors.unauthorized";
  final String forbidden = "errors.forbidden";
  final String notFound = "errors.not_found";
  final String conflict = "errors.conflict";
  final String unprocessableEntity = "errors.unprocessable_entity";
  final String internalServerError = "errors.internal_server_error";
  final String serviceUnavailable = "errors.service_unavailable";
  final String unknownError = "errors.unknown_error";
  final String expiredToken = "errors.expired_token";
  final String invalidCredentials = "errors.invalid_credentials";
  final String accountLocked = "errors.account_locked";
  final String emailNotVerified = "errors.email_not_verified";
  final String insufficientFunds = "errors.insufficient_funds";
  final String paymentDeclined = "errors.payment_declined";
  final String invalidCardDetails = "errors.invalid_card_details";
  final String duplicateEntry = "errors.duplicate_entry";
  final String dataConflict = "errors.data_conflict";
  final String recordNotFound = "errors.record_not_found";
  final String invalidInput = "errors.invalid_input";
  final String fileTooLarge = "errors.file_too_large";
  final String unsupportedFileFormat = "errors.unsupported_file_format";
  final String storageFull = "errors.storage_full";
  final String permissionDenied = "errors.permission_denied";
  final String deviceNotSupported = "errors.device_not_supported";
  final String connectionTimeout = "errors.connection_timeout";
  final String sendTimeout = "errors.send_timeout";
  final String receiveTimeout = "errors.receive_timeout";
  final String badCertificate = "errors.bad_certificate";
  final String badResponse = "errors.bad_response";
  final String requestCancelled = "errors.request_cancelled";
  final String noInternetConnection = "errors.no_internet_connection";
  final String validationError = "errors.validation_error";
  final String invalidCode = "errors.invalid_code";
}
