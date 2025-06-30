abstract class RoutePaths {
  // 🏠 Main Screens
  static const splash = "/splash";
  static const home = "/home";
  static const onboarding = "/onboarding";

  // 🔐 Authentication
  static const signup = "/signup";
  static const login = "/login";
  static const verificationCode = "/verificationcode";
  static const forgetPassword = "/forgetpassword";
  static const resetPassword = "/resetpassword";
  static const otp = "/otp";
  static const forgotPasswordVerificationCode =
      "/forgotpasswordverificationcode";

  // 📌 Features
  static const search = "search";
  static const upload = "/upload";
  static const notifications = "/notification";
  static const myProfile = "/my-profile";
  static const profileWithoutId = "/profile";
  static const profile = "$profileWithoutId/:id";
  static const editProfile = "/edit-profile";
  static const settings = "/settings";
  static const themeSelection = "/theme-selection";
  static const languageSelection = "/language-selection";

  // 🍽 Recipe Details
  static const recipeDetailsWithoutId = "/recipe-detail";
  static const recipeDetails = "$recipeDetailsWithoutId/:id";
}
