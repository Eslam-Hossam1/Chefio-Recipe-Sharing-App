import 'package:chefio_app/core/utils/shared_prefernce_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize SharedPreferences asynchronously
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register SharedPreferencesHelper singleton
  getIt.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(sharedPreferences),
  );

}
