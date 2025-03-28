import 'dart:developer';

import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static const String _baseUrl = "https://chefio-beta.vercel.app/recipe-detail/";
  static const String _customScheme = "chefio_app://recipe-detail/";

  /// Share recipe using HTTPS App Link
  static Future<void> shareRecipe({required String recipeId, bool useAppLink = true}) async {
    final String link = useAppLink ? "$_baseUrl$recipeId" : "$_customScheme$recipeId";
    final String message = "Check out this delicious recipe! 🍽️\n$link";
    
    try {
      await Share.share(message);
    } catch (e) {
      log("Error sharing: $e");
    }
  }
}
