import 'dart:developer';

import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/cache/secure_storage_helper.dart';
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
    options.headers[ApiKeys.authorization] = token;
    options.headers[ApiKeys.client] = "not-browser";
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    if (err.response?.statusCode == 401) {
      if (authCredentialsHelper.userIsAuthenticated() &&
          !(err.requestOptions.extra['retrying'] ?? false)) {
        // ⬅️ منع التكرار

        err.requestOptions.extra['retrying'] =
            true; // ⬅️ إضافة علامة إننا بنعمل retry

        try {
          bool refreshed = await _refreshToken();
          if (refreshed) {
            return handler.resolve(await _retry(err.requestOptions));
          } else {
            // authCredentialsHelper
            //     .clearTokens(); // ⬅️ حذف بيانات المستخدم لو التوكن فشل
          }
        } catch (e) {
          log(e.toString());
          // authCredentialsHelper
          //     .clearTokens(); // ⬅️ تأكيد حذف التوكنات لو حصل خطأ
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
    try {
      final response = await client.post(EndPoints.refreshToken, data: {
        ApiKeys.refreshToken: authCredentialsHelper.refreshToken,
      });
      log(response.toString());
      log('refresh success');
      final json = response.data;
      String accessToken = json[ApiKeys.newAccessToken];
      authCredentialsHelper.storeAccessToken(accessToken);
      return true;
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode != null) {
          if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
            authCredentialsHelper
                .clearTokens(); // ⬅️ احذف بيانات المستخدم لو التوكن فشل
            log('refresh token expired');
          }
        }
      }

      return false;
    }
  }
}
