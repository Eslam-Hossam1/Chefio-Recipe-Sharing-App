part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingMore extends HomeState {}

final class HomefirstLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

//while scrolling
final class HomeLoadingMoreFailure extends HomeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeLoadingMoreFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}

//at first time
final class HomeFirstApiFetchFailure extends HomeState {
  final String errorMessage;
  final String errorLocalizationKey;

  const HomeFirstApiFetchFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}

// final class HomeFailureCache extends HomeState {
//   final String errorMessage;
//   final String errorLocalizationKey;

//   const HomeFailureCache(
//       {required this.errorMessage, required this.errorLocalizationKey,});
// }
// final class HomeHasNoMore extends HomeState {}
