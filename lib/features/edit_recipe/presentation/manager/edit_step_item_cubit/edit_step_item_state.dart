part of 'edit_step_item_cubit.dart';

sealed class StepItemState extends Equatable {
  const StepItemState();

  @override
  List<Object> get props => [];
}

final class StepInitial extends StepItemState {}

final class NoImage extends StepItemState {}

final class UrlImage extends StepItemState {
  final String imageUrl;

  const UrlImage({required this.imageUrl});
}

final class PickedSetStepImage extends StepItemState {
    final File stepImageFile;

 const  PickedSetStepImage({required this.stepImageFile});

}
