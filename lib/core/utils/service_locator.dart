import 'package:app_links/app_links.dart';
import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/utils/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/categories_service.dart';
import 'package:chefio_app/core/utils/cropped_image_picker_helper.dart';
import 'package:chefio_app/core/utils/decoder/jwt_decoder_impl.dart';
import 'package:chefio_app/core/utils/deep_link_handler.dart';
import 'package:chefio_app/core/utils/google_auth_service.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/share_helper.dart';
import 'package:chefio_app/core/utils/shared_prefernce_helper.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/repos/home_repo_impl.dart';
import 'package:chefio_app/features/onboarding/presentation/view_model/onboarding_view_model.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo_impl.dart';
import 'package:chefio_app/features/splash/presentation/view_model/splash_view_model.dart';
import 'package:chefio_app/features/upload/data/repos/upload_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final secureStorage = FlutterSecureStorage(
    aOptions: getAndroidOptions(),
  );

  getIt.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(sharedPreferences),
  );

  getIt.registerSingleton<SecureStorageHelper>(
    SecureStorageHelper(secureStorage),
  );

  getIt.registerLazySingleton<OnboardingViewModel>(
    () => OnboardingViewModel(),
  );

  getIt.registerSingleton<AuthCredentialsHelper>(
    AuthCredentialsHelper(
        secureStorageHelper: getIt<SecureStorageHelper>(),
        jwtDecoder: JwtDecoderImpl()),
  );

  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton<GoogleAuthService>(
    GoogleAuthService(),
  );
  getIt.registerSingleton<SplashViewModel>(
    SplashViewModel(
      getIt<AuthCredentialsHelper>(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt<DioConsumer>(),
      getIt<GoogleAuthService>(),
    ),
  );
  getIt.registerSingleton<CategoriesService>(
      CategoriesService(getIt<DioConsumer>(), EndPoints.categories));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt<DioConsumer>(),
      getIt<CategoriesService>(),
    ),
  );
  getIt.registerSingleton<UploadRepoImpl>(
    UploadRepoImpl(
      getIt<DioConsumer>(),
      getIt<CategoriesService>(),
    ),
  );
  getIt.registerSingleton<RecipeDetailsRepoImpl>(
    RecipeDetailsRepoImpl(
      getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<DeepLinkHandler>(
    DeepLinkHandler(
      appLinks: AppLinks(),
      authCredentialsHelper: getIt<AuthCredentialsHelper>(),
    ),
  );
  getIt.registerSingleton<ShareHelper>(
    ShareHelper(),
  );
  getIt.registerSingleton<CroppedImagePickerHelper>(
   CroppedImagePickerHelper(
    ImagePicker(),
    ImageCropper(),
   ),

  );
}
