import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/notifiactions/data/models/notification_model.dart';
import 'package:chefio_app/features/notifiactions/data/repos/notifications_repo.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit({required NotificationsRepo notificationsRepo})
      : _notificationsRepo = notificationsRepo,
        super(NotificationsInitial());
  int page = 1;
  int limit = 20;
  bool hasMore = true;
  bool isLoading = false;
  List<NotificationEntity> notifications = [];
  String? chefId;
  Future<void> fetchNotifications() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    if (notifications.isNotEmpty) {
      emit(NotificationsFetchMore());
    } else {
      emit(NotificationsFirstFetchLoading());
    }
    var notificationsResult =
        await _notificationsRepo.fetchNotifications(page: page, limit: limit);
    notificationsResult.fold(
      (failure) {
        if (notifications.isEmpty) {
          emit(
            NotificationsInitialFetchFailure(
              errMsg: failure.errMsg,
              errLocalizationKey: failure.localizaitonKey,
            ),
          );
        } else {
          emit(
            NotificationsFetchMoreFailure(
              errMsg: failure.errMsg,
              errLocalizationKey: failure.localizaitonKey,
            ),
          );
        }
      },
      (notifications) {
        if (notifications.length <= limit) {
          hasMore = false;
        }
        if (notifications.isEmpty && this.notifications.isEmpty) {
          isLoading = false;
          emit(NotificationsEmpty());
          return;
        }
        this.notifications.addAll(notifications);
        page += 1;
        isLoading = false;
        emit(NotificationsSuccess());
      },
    );
  }

  Future<void> refersh() async {
    page = 1;
    hasMore = true;
    isLoading = false;
    notifications.clear();
    emit(NotificationsInitial());
    await fetchNotifications();
  }
}
