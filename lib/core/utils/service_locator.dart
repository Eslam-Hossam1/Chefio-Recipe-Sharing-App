import 'package:app_links/app_links.dart';
import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/helpers/cropped_image_picker_helper.dart';
import 'package:chefio_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:chefio_app/core/helpers/share_helper.dart';
import 'package:chefio_app/core/services/categories_service.dart';
import 'package:chefio_app/core/services/follow_chef_service.dart';
import 'package:chefio_app/core/services/google_auth_service.dart';
import 'package:chefio_app/core/services/like_recipe_service.dart';
import 'package:chefio_app/core/services/notifications/local_notifications_service.dart';
import 'package:chefio_app/core/services/notifications/push_notifications_service.dart';
import 'package:chefio_app/core/utils/cache/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/cache/shared_prefernce_helper.dart';
import 'package:chefio_app/core/utils/deep_link_handler.dart';
import 'package:chefio_app/core/utils/jwt_decoder/jwt_decoder_impl.dart';
import 'package:chefio_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:chefio_app/features/edit_profile/data/repos/edit_profile_repo_impl.dart';
import 'package:chefio_app/features/edit_recipe/data/repos/edit_recipe_repo_impl.dart';
import 'package:chefio_app/features/home/data/repos/home_repo_impl.dart';
import 'package:chefio_app/features/notifiactions/data/repos/notifications_repo_impl.dart';
import 'package:chefio_app/features/otp/data/repos/otp_repo_impl.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo_impl.dart';
import 'package:chefio_app/features/search/data/repos/search_recipe_rebo_impl.dart';
import 'package:chefio_app/features/upload_recipe/data/repos/upload_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

  getIt.registerSingleton<AuthCredentialsHelper>(
    AuthCredentialsHelper(
        secureStorageHelper: getIt<SecureStorageHelper>(),
        jwtDecoder: JwtDecoderImpl()),
  );
  getIt.registerSingleton<Dio>(
    Dio(),
  );

  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<LocalNotificationsService>(
    LocalNotificationsService(
      flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<PushNotificationsService>(
    PushNotificationsService(
      firebaseMessaging: FirebaseMessaging.instance,
      localNotificationsService: getIt<LocalNotificationsService>(),
      apiConsumer: getIt<DioConsumer>(),
      authCredentialsHelper: getIt<AuthCredentialsHelper>(),
    ),
  );

  getIt.registerSingleton<GoogleAuthService>(
    GoogleAuthService(),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt<DioConsumer>(),
      getIt<GoogleAuthService>(),
      getIt<PushNotificationsService>(),
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
  getIt.registerSingleton<SearchRecipeRepoImpl>(
    SearchRecipeRepoImpl(
      getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      apiConsumer: getIt<DioConsumer>(),
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
  getIt.registerSingleton<LikeRecipeService>(
    LikeRecipeService(
      apiConsumer: getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<FollowChefService>(
    FollowChefService(
      apiConsumer: getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<EditProfileRepoImpl>(
    EditProfileRepoImpl(
      apiConsumer: getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<NotificationsRepoImpl>(
    NotificationsRepoImpl(
      apiConsumer: getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<OtpRepoImpl>(
    OtpRepoImpl(),
  );
  getIt.registerSingleton<EditRecipeRepoImpl>(
    EditRecipeRepoImpl(
      getIt<DioConsumer>(),
    ),
  );
  getIt.registerSingleton<OnBoardingCacheHelper>(
    OnBoardingCacheHelper(
      sharedPreferencesHelper: getIt<SharedPreferencesHelper>(),
    ),
  );
}
