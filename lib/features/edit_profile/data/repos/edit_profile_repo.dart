import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:chefio_app/features/edit_profile/data/models/success_edit_model/success_edit_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class EditProfileRepo {
  Future<Either<ApiFailure, SuccessEditProfileModel>> editProfile(
      {required EditProfileModel editProfileModel});
}
