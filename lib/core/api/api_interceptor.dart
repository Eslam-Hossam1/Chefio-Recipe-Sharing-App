import 'dart:developer';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/dialog_helper.dart';
import 'package:chefio_app/core/routing/app_router.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class ApiInterceptor extends Interceptor {
  final Dio client;
  final AuthCredentialsHelper authCredentialsHelper;

  ApiInterceptor({
    required this.client,
    required this.authCredentialsHelper,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = authCredentialsHelper.accessToken;

    options.headers[ApiKeys.authorization] = "Bearer $token";
    options.headers[ApiKeys.client] = "not-browser";

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    final isUnauthorized = err.response?.statusCode == 401;
    final isUserLoggedIn = authCredentialsHelper.userIsAuthenticated();
    final hasNotRetried = !(err.requestOptions.extra['retrying'] ?? false);
    final isRefreshRequest =
        err.requestOptions.path.contains(EndPoints.refreshToken);

    if (isRefreshRequest) {
      return handler.next(err);
    }

    if (isUnauthorized && isUserLoggedIn && hasNotRetried) {
      err.requestOptions.extra['retrying'] = true;

      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          final response = await _retry(err.requestOptions);
          return handler.resolve(response);
        } else {
          _handleSessionEnd();
        }
      } catch (e) {
        log(e.toString());

        _handleSessionEnd();
      }
    }

    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return client.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> _refreshToken() async {
    try {
      final response = await client.post(EndPoints.refreshToken, data: {
        ApiKeys.refreshToken: "Bearer ${authCredentialsHelper.refreshToken}",
      });

      final json = response.data;
      final newAccessToken = json[ApiKeys.newAccessToken];

      await authCredentialsHelper.storeAccessToken(newAccessToken);

      return true;
    } catch (e) {
      return false;
    }
  }

  void _handleSessionEnd() {
    authCredentialsHelper.clearTokens();

    final context = AppRouter.rootNavigatorKey.currentState?.context;
    if (context != null) {
      DialogHelper.showEndSessionDialog(
        context,
        onDismissCallback: (_) => context.go(RoutePaths.login),
        btnOkOnPress: () => context.go(RoutePaths.login),
      );
    }
  }
}
