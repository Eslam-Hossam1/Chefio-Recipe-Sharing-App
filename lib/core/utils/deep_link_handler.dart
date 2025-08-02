import 'package:app_links/app_links.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/routing/routing_helper.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeepLinkHandler {
  final AppLinks _appLinks;
  final AuthCredentialsHelper authCredentialsHelper;
  DeepLinkHandler(
      {required AppLinks appLinks, required this.authCredentialsHelper})
      : _appLinks = appLinks;

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
    if (!authCredentialsHelper.userIsAuthenticated()) {
      context.go(RoutePaths.login);
    } else if (uri.pathSegments.isNotEmpty &&
        uri.pathSegments.contains('get-recipe')) {
      final recipeId = uri.pathSegments.last;
      if (recipeId.isNotEmpty) {
        context.go(RoutingHelper.getRecipeDetailsPath(recipeId: recipeId));
      }
    }
  }
}
