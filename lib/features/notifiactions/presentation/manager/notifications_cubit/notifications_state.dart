part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsSuccess extends NotificationsState {
  List<NotificationModel> notifications;
  NotificationsSuccess({required this.notifications});
}

final class NotificationsLoading extends NotificationsState {}
final class NotificationsEmpty extends NotificationsState {}

final class NotificationsFailure extends NotificationsState {
  final String errorMessage;
  final String errorLocalizationKey;

  const NotificationsFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}
