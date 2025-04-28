part of 'home_categories_cubit.dart';

sealed class HomeCategoriesState extends Equatable {
  const HomeCategoriesState();

  @override
  List<Object> get props => [];
}

final class HomeCategoriesInitial extends HomeCategoriesState {}

final class HomeCategoriesLoaded extends HomeCategoriesState {}

final class HomeCategoriesLoading extends HomeCategoriesState {}

final class HomeCategoriesFailure extends HomeCategoriesState {
  final String errorMessage;
  final String errorLocalizationKey;
  const HomeCategoriesFailure({
    required this.errorMessage,
    required this.errorLocalizationKey,
  });
}
