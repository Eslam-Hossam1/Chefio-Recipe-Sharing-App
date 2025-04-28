abstract class EndPoints {
  static const String baseUrl = "https://chefio-beta.vercel.app/api/v1/";
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
  static const String categories = "recipe/get-categories";
  //test
  static const String googleSignIn = "auth/google-signin";
  static const String recipes = "recipe/get-recipes";
  static const String uploadRecipe = "recipe/create-recipe";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }

  static String getEditRecipeEndPoint(String recipeId) {
    return "recipe/update-recipe/$recipeId";
  }

  static String getRecipeDetailsEndPoint(String recipeId) {
    return "recipe/get-recipe/$recipeId";
  }

  static String getToggleLikeRecipeEndPoint(String recipeId) {
    return "recipe/likes/$recipeId";
  }

  static String getRecipeLikersEndPoint(String recipeId) {
    return "recipe/likes/get-recipe-likes/$recipeId";
  }
}
