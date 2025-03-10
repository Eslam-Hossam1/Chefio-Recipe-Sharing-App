import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/utils/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiInterceptor extends Interceptor {
  final Dio client;
  final AuthCredentialsHelper authCredentialsHelper;
  ApiInterceptor({required this.client, required this.authCredentialsHelper});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = authCredentialsHelper.accessToken;
    options.headers[ApiKeys.token] = token != null ? 'FOODAPI $token' : null;
    options.headers[ApiKeys.client] = "not-browser";
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      if (authCredentialsHelper.userIsAuthenticated()) {
        try {
          if (await _refreshToken()) {
            return handler.resolve(await _retry(err.requestOptions));
          } else {
            handler.next(err);
          }
        } catch (e) {
          handler.next(err);
        }
      }
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return client.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> _refreshToken() async {
    final response = await client.post(EndPoints.refreshToken, data: {
      EndPoints.refreshToken: authCredentialsHelper.refreshToken,
    });

    if (response.statusCode == 200) {
      final json = response.data;
      String accessToken = json[ApiKeys.accessToken];
      authCredentialsHelper.storeAccessToken(accessToken);
      return true;
    } else {
      authCredentialsHelper
          .clearTokens(); // ⬅️ احذف بيانات المستخدم لو التوكن فشل
      return false;
    }
  }
}
