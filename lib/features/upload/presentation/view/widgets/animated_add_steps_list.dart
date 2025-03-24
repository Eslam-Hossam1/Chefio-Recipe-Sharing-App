import 'package:chefio_app/features/upload/presentation/manager/set_recipe_cubit/upload_recipe_cubit.dart';
import 'package:chefio_app/features/upload/presentation/view/widgets/enter_step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedAddStepsList extends StatelessWidget {
  const AnimatedAddStepsList({
    super.key,
    required this.animatedListKey,
  });

  final GlobalKey<SliverAnimatedListState> animatedListKey;

  @override
  Widget build(BuildContext context) {
    var uploadRecipeCubit = context.read<UploadRecipeCubit>();
    return SliverAnimatedList(
      key: animatedListKey,
      initialItemCount: uploadRecipeCubit.steps.length,
      itemBuilder: (context, index, animation) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ),
            ),
            child: Dismissible(
              key: Key('${uploadRecipeCubit.steps[index].hashCode}'),
              onDismissed: (direction) => uploadRecipeCubit.removeStep(
                stepsAnimatedListKey: animatedListKey,
                index: index,
              ),
              background: Container(
                color: Colors.red,
                child: Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              direction: uploadRecipeCubit.steps.length < 2
                  ? DismissDirection.none
                  : DismissDirection.startToEnd,
              child: EnterStepItem(
                stepIndex: index,
              ),
            ),
          ),
        );
      },
    );
  }
}
