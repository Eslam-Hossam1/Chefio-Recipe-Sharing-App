class EndPoint {
  static String baseUrl = "https://chefio-beta.vercel.app/api/v1/";
  static String signIn = "auth/signin/";
  static String signUp = "auth/signup";
  static String sendVerificationCode = "auth/send-verification-code";
  static String verifyVerificationCode = "auth/verify-verification-code";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

abstract class ApiKeys {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
