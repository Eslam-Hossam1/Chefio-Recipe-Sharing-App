part of 'step_item_cubit.dart';

sealed class StepItemState extends Equatable {
  const StepItemState();

  @override
  List<Object> get props => [];
}

final class StepInitial extends StepItemState {}

final class NoImage extends StepItemState {}

final class PickedSetStepImage extends StepItemState {
  final File stepImageFile;

  const PickedSetStepImage({required this.stepImageFile});
}
