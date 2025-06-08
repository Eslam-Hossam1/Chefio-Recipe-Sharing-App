import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/notifiactions/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationsRepo {
  Future<Either<ApiFailure, List<NotificationModel>>> fetchNotifications();
}
