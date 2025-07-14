abstract class RoutePaths {
  static const splash = "/splash";
  static const initialRoute = "/initial-route";

  //OnBoarding
  static const onboarding = "/onboarding";

  // 🔐 Authentication
  static const signup = "/signup";
  static const login = "/login";
  static const forgetPassword = "/forgetpassword";
  static const resetPassword = "/resetpassword";

  //Otp
  static const otp = "/otp";

  //Home
  static const home = "/home";

  //Search
  static const search = "search";
  //Notification
  static const notifications = "/notification";

  //Settings
  static const settings = "/settings";
  static const themeSelection = "/theme-selection";
  static const languageSelection = "/language-selection";

  //Recipe
  static const editRecipe = "/edit-recipe";
  static const upload = "/upload";
  static const recipeDetailsWithoutId = "/recipe-detail";
  static const recipeDetails = "$recipeDetailsWithoutId/:id";

  //Profile
  static const myProfile = "/my-profile";
  static const profileWithoutId = "/profile";
  static const profile = "$profileWithoutId/:id";
  static const editProfile = "/edit-profile";
}
