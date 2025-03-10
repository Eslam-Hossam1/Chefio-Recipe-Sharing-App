import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_interceptors.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/utils/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptor(
        client: dio, authCredentialsHelper: getIt<AuthCredentialsHelper>()));
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    }
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    final response = await dio.delete(
      path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    final response = await dio.patch(
      path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    final response = await dio.post(
      path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
