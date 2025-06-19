import 'dart:developer';

import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:share_plus/share_plus.dart';

class ShareHelper {
  //      "https://chefio-beta.vercel.app/recipe-detail/";

  static const String _baseUrl = 'https://chefio-ten.vercel.app/';

  /// Share recipe using HTTPS App Link
  Future<void> shareRecipe({
    required String recipeId,
  }) async {
    final String link = "${_baseUrl}recipes/$recipeId";
    final String message = "Check out this delicious recipe! 🍽️\n$link";

    try {
      await Share.share(message);
    } catch (e) {
      log("Error sharing: $e");
    }
  }

  Future<void> shareProfile({required String chefId}) async {
    final String link = "${_baseUrl}profile/$chefId";
    final String message = "Check out this Chef Profile! 🍽️\n$link";
    try {
      await Share.share(message);
    } catch (e) {
      log("Error Message");
    }
  }
}
