import 'package:chefio_app/features/upload/presentation/view/widgets/enter_step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedAddStepsList extends StatefulWidget {
  const AnimatedAddStepsList({
    super.key,
    required this.animatedListKey,
    required this.stepsList,
  });

  final GlobalKey<SliverAnimatedListState> animatedListKey;
  final List stepsList;
  @override
  State<AnimatedAddStepsList> createState() =>
      _AnimatedAddStepsListState();
}

class _AnimatedAddStepsListState
    extends State<AnimatedAddStepsList> {
  late List stepsList;
  @override
  void initState() {
    stepsList = widget.stepsList;
    super.initState();
  }

  void removeStep(int index) {
    widget.animatedListKey.currentState!.removeItem(index,
        (context, animation) {
      return SizedBox(width: 0, height: 0);
    });
    stepsList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: widget.animatedListKey,
      initialItemCount: stepsList.length,
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
                key: Key('${stepsList[index].hashCode}'),
                onDismissed: (direction) => removeStep(index),
                background: Container(
                  color: Colors.red,
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                direction:stepsList.length<2? DismissDirection.none: DismissDirection.startToEnd,
                child: EnterStepItem(stepIndex: index,),),
          ),
        );
      },
    );
  }
}
