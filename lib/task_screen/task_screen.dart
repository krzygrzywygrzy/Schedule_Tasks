import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_tasks/const.dart';
import 'package:schedule_tasks/models/task_model.dart';
import 'package:schedule_tasks/task_screen/add_task_screen.dart';
import 'package:schedule_tasks/task_screen/bloc/task_bloc.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              return loading();
            } else if (state is MainScreen) {
              return loaded(state.tasks, state.date);
            } else if (state is AddScreen) {
              return AddTaskScreen();
            }
          },
        ),
      ),
    );
  }

  Widget loaded(List<Task> tasks, DateTime date) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    "${weekDays[date.weekday-1]} ${date.day}.${date.month}.${date.year}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollBehavior(),
                child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.down,
                  color: Theme.of(context).primaryColor,
                  child: ListView(
                    children: [
                      Container(
                        height: 50,
                        child: Placeholder(),
                      ),
                      Container(
                        height: 50,
                        child: Placeholder(),
                      ),
                      Container(
                        height: 50,
                        child: Placeholder(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: GestureDetector(
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
          ),
        ),
      ],
    );
  }

  Widget loading() {
    return Center(
      child: Container(
        child: Text(
          "your data is loading...",
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(LoadAllTasks());
    super.initState();
  }
}
