import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_tasks/task_screen/bloc/task_bloc.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<TaskBloc>(context).add(DisplayAddTaskScreen());
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                spreadRadius: 0.4,
                blurRadius: 6,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
