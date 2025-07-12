part of 'step_item_cubit.dart';

sealed class StepItemState extends Equatable {
  const StepItemState();

  @override
  List<Object> get props => [];
}

final class StepInitial extends StepItemState {}

final class NoImage extends StepItemState {}




final class PickedSetStepImage extends PickedStepImageState  {
 const PickedSetStepImage({required super.stepImageFile});

}

abstract class PickedStepImageState extends StepItemState {
  final File stepImageFile;

 const PickedStepImageState({required this.stepImageFile});

}
