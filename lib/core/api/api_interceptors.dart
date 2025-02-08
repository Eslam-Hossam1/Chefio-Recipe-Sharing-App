import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    String? token = await getToken();
    options.headers[ApiKeys.token] = token !=
            null
        ? 'FOODAPI $token'
        : null;
    super.onRequest(options, handler);
  }

  Future<String?> getToken()async {
    return await  getIt<SecureStorageHelper>()
              .getString(key: ApiKeys.token);
  }
}
