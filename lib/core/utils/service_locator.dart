import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/shared_prefernce_helper.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chefio_app/features/onboarding/presentation/view_model/onboarding_view_model.dart';
import 'package:chefio_app/features/splash/presentation/view_model/splash_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize SharedPreferences asynchronously
  final sharedPreferences = await SharedPreferences.getInstance();
  // Initialize FlutterSecureStorage
  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final secureStorage = FlutterSecureStorage(aOptions: getAndroidOptions());
  // Register SharedPreferencesHelper singleton
  getIt.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(sharedPreferences),
  );
  // Register SecureStorageHelper singleton
  getIt.registerSingleton<SecureStorageHelper>(
      SecureStorageHelper(secureStorage));
  // Register ViewModel singletons
  getIt.registerSingleton<SplashViewModel>(SplashViewModel());
  getIt.registerLazySingleton<OnboardingViewModel>(() => OnboardingViewModel());
  // Register DioConsumer singleton
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  // Register AuthRepo singleton
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiConsumer: getIt<DioConsumer>()));
}
