abstract class EndPoints {
  static const String baseUrl = "https://dummyjson.com/";
  static const String logIn = "auth/signin/";
  static const String signUp = "auth/signup";
  static const String sendVerificationCode = "auth/send-verification-code";
  static const String verifyVerificationCode = "auth/verify-verification-code";
 
  static const String sendForgotPasswordVerificationCode =
      "auth/send-forgot-password-code";
  static const String verifyForgotPasswordVerificationCode =
      "auth/verify-forgot-password-code";
  static const String resetPassword = "auth/reset-password";
  static const String refreshToken = "auth/refresh-token";
   //test
  static const String googleSignIn = "auth/google-signin";
  static const String home = "products";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}
