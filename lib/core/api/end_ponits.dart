class EndPoint {
  static const String baseUrl = "https://chefio-beta.vercel.app/api/v1/";
  static const String signIn = "auth/signin/";
  static const String signUp = "auth/signup";
  static const String sendVerificationCode = "auth/send-verification-code";
  static const String verifyVerificationCode = "auth/verify-verification-code";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

abstract class ApiKeys {
  static const String status = "status";
  static const String errorMessage = "ErrorMessage";
  static const String email = "email";
  static const String password = "password";
  static const String token = "token";
  static const String message = "message";
  static const String id = "id";
  static const String name = "name";
  static const String phone = "phone";
  static const String confirmPassword = "confirmPassword";
  static const String location = "location";
  static const String profilePic = "profilePic";
}
