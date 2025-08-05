import 'dart:developer';

import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/notifiactions/data/models/notification_model.dart';
import 'package:chefio_app/features/notifiactions/data/repos/notifications_repo.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final ApiConsumer _apiConsumer;

  NotificationsRepoImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<Either<ApiFailure, List<NotificationEntity>>> fetchNotifications({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _apiConsumer.get(
        EndPoints.notifications,
        queryParameters: {
          ApiKeys.page: page,
          ApiKeys.limit: limit,
        },
      );
      List<NotificationEntity> notificationEntities =
          getNotificationEntitiesFromResponse(response);
      return Right(notificationEntities);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        log('Error fetching notifications: $e');
        return Left(DioApiFailure.unknown(e.toString()));
      }
    }
  }

  List<NotificationEntity> getNotificationEntitiesFromResponse(response) {
    List<NotificationEntity> notificationsEntities =
        (response[ApiKeys.notifications][ApiKeys.notifications] as List)
            .map(
              (notification) => NotificationModel.fromJson(notification),
            )
            .toList();
    return notificationsEntities;
  }
}
