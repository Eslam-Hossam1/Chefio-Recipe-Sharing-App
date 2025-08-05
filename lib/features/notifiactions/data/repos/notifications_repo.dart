import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationsRepo {
  Future<Either<ApiFailure, List<NotificationEntity>>> fetchNotifications({
    required int page,
    required int limit,
  });
}
