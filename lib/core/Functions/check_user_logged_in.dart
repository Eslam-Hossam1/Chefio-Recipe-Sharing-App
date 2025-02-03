import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';

Future<bool> checkUserLoggedIn() async {
  String? isLoggedIn =
      await getIt<SecureStorageHelper>().getString(key: Constants.kTokenKey);
  return isLoggedIn == null ? false : true;
}
