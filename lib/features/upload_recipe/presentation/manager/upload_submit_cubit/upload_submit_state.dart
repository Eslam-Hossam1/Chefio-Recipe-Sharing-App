part of 'upload_submit_cubit.dart';

sealed class UploadSubmitState extends Equatable {
  const UploadSubmitState();

  @override
  List<Object> get props => [];
}

final class UploadSubmitInitial extends UploadSubmitState {}

final class UploadSubmitLoading extends UploadSubmitState {}

final class UploadSubmitSuccess extends UploadSubmitState {}

final class UploadSubmitFailure extends UploadSubmitState {
  final String errorMessage;
  final String errorLocalizationKey;

  const UploadSubmitFailure(
      {required this.errorMessage, required this.errorLocalizationKey});
}
