import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/notifiactions/data/models/notification_model.dart';
import 'package:chefio_app/features/notifiactions/data/repos/notifications_repo.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit({required NotificationsRepo notificationsRepo})
      : _notificationsRepo = notificationsRepo,
        super(NotificationsInitial());
  Future<void> fetchNotifications() async {
    emit(NotificationsLoading());
    var notificationsResult = await _notificationsRepo.fetchNotifications();
    notificationsResult.fold(
      (failure) {
        emit(NotificationsFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ));
      },
      (notifications) {
        emit(NotificationsSuccess(notifications: notifications));
      },
    );
  }
}
