import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] = getIt<SecureStorageHelper>()
                .getString(key: ApiKeys.token) !=
            null
        ? 'FOODAPI ${getIt<SecureStorageHelper>().getString(key: ApiKeys.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
