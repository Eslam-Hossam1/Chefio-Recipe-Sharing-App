part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsFirstFetchLoading extends NotificationsState {}

final class NotificationsInitialFetchFailure extends NotificationsState {
  final String errMsg;
  final String errLocalizationKey;

  const NotificationsInitialFetchFailure(
      {required this.errMsg, required this.errLocalizationKey});
}

final class NotificationsFetchMore extends NotificationsState {}

final class NotificationsFetchMoreFailure extends NotificationsState {
  final String errMsg;
  final String errLocalizationKey;

  const NotificationsFetchMoreFailure(
      {required this.errMsg, required this.errLocalizationKey});
}

final class NotificationsSuccess extends NotificationsState {}

final class NotificationsEmpty extends NotificationsState {}
