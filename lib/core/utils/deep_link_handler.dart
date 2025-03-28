import 'package:app_links/app_links.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeepLinkHandler {
  final AppLinks _appLinks;

  DeepLinkHandler({required AppLinks appLinks}) : _appLinks = appLinks;

  void startHandleDeepLinks(BuildContext context) {
    _setupDeepLinkHandler(context);
  }

  void _setupDeepLinkHandler(BuildContext context) async {
    // Handle incoming deep links
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        print('Deep link received: $uri');
        _handleDeepLink(uri, context);
      }
    });

    // Handle initial deep link
    final Uri? initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      print('Initial deep link: $initialLink');
      _handleDeepLink(initialLink, context);
    }
  }

  void _handleDeepLink(Uri uri, BuildContext context) {
    if (uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'recipe-detail') {
      final recipeId = uri.pathSegments.last;
      if (recipeId.isNotEmpty) {
        context.go(RoutingHelper.getRecipeDetailsPath(recipeId: recipeId));
      }
    }
  }
}
