import 'package:chefio_app/core/api/api_keys.dart';
import 'package:dio/dio.dart';

class EditProfileModel {
  final MultipartFile? chefProfilePicture;
  final String chefUsername;

  const EditProfileModel(
      {required this.chefProfilePicture, required this.chefUsername});
  Map<String, dynamic> toJson() => {
        ApiKeys.username: chefUsername,
        ApiKeys.profilePicture: chefProfilePicture,
      };
}
