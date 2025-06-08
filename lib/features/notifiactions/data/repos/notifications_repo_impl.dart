import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/notifiactions/data/models/notification_model.dart';
import 'package:chefio_app/features/notifiactions/data/repos/notifications_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final ApiConsumer _apiConsumer;

  NotificationsRepoImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<Either<ApiFailure, List<NotificationModel>>>
      fetchNotifications() async {
    try {
      // final response = await _apiConsumer.get(
      //   EndPoints.notifications,
      // );
      //final notificationModel = NotificationModel.fromJson(response);
      return Right([
        NotificationModel(
          username: 'username',
          chefId: '123',
          chefProfilePicture: Constants.nullUserImageUrl,
          createdFrom: DateTime.now(),
          message: 'hi',
          recipeId: 'adsfaf',
          recipePicture: Constants.nullUserImageUrl,
          type: 'like',
        ),
      ]);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(e.toString()));
      }
    }
  }
}
