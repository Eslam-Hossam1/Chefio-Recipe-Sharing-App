abstract class EndPoint {
  static const String baseUrl = "https://chefio-beta.vercel.app/api/v1/";
  static const String logIn = "auth/signin/";
  static const String signUp = "auth/signup";
  static const String sendVerificationCode = "auth/send-verification-code";
  static const String verifyVerificationCode = "auth/verify-verification-code";
  //test
  static const String enterEmailToRecoverPassword =
      "auth/verify-verification-code";
  static const String resetPassword = "auth/verify-verification-code";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}
