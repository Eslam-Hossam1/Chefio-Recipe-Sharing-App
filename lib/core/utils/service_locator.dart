import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Utils
import 'package:recipe_app/core/utils/shared_prefernce_helper.dart';

// Repos
import 'package:recipe_app/features/auth/data/repos/auth_repo_impl.dart';

// View Models
import 'package:recipe_app/features/on_boarding/presentation/view_model/onboarding_view_model.dart';
import 'package:recipe_app/features/splash/presentation/view_model/splash_view_model.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize SharedPreferences asynchronously
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register SharedPreferencesHelper singleton
  getIt.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(sharedPreferences),
  );

  // Register SplashViewModel and OnboardingViewModel lazily
  getIt.registerLazySingleton<SplashViewModel>(() => SplashViewModel());
  getIt.registerLazySingleton<OnboardingViewModel>(() => OnboardingViewModel());

  // Register AuthRepoImpl lazily
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl());
}
