import 'dart:developer';

import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:chefio_app/features/edit_profile/data/models/success_edit_model/success_edit_profile_model.dart';
import 'package:chefio_app/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final ApiConsumer _apiConsumer;

  EditProfileRepoImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<Either<ApiFailure, SuccessEditProfileModel>> editProfile(
      {required EditProfileModel editProfileModel}) async {
    try {
      final response = await _apiConsumer.patch(EndPoints.editProfile,
          data: editProfileModel.toJson(), isFromData: true);
      SuccessEditProfileModel successEditProfileModel =
          SuccessEditProfileModel.fromJson(response);
      return Right(successEditProfileModel);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  DioApiFailure handleException(Object e) {
    if (e is DioException) {
      return DioApiFailure.fromDioException(
        e,
      );
    } else {
      log(e.toString());
      return DioApiFailure.unknown(
        e.toString(),
      );
    }
  }
}
