part of 'step_item_cubit.dart';

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

final class PickedAddStepImage extends PickedStepImageState {
 const PickedAddStepImage({required super.stepImageFile});

}

final class PickedChangeStepImage extends PickedStepImageState  {
 const PickedChangeStepImage({required super.stepImageFile});

}

abstract class PickedStepImageState extends StepItemState {
  final File stepImageFile;

 const PickedStepImageState({required this.stepImageFile});

}
