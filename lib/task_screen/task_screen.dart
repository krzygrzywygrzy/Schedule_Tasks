import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_tasks/const.dart';
import 'package:schedule_tasks/models/task_model.dart';
import 'package:schedule_tasks/task_screen/add_task_screen.dart';
import 'package:schedule_tasks/task_screen/bloc/task_bloc.dart';
import 'package:schedule_tasks/widgets/floating_action_button.dart';
import 'package:schedule_tasks/widgets/task_card.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white54),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskLoading) {
                return loading();
              } else if (state is MainScreen) {
                return loaded(state.tasks, state.date);
              } else if (state is AddScreen) {
                return AddTaskScreen();
              } else {
                return empty();
              }
            },
          ),
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
                    "${weekDays[date.weekday - 1]} ${date.day}.${date.month}.${date.year}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: tasks.length != 0
                  ? ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        axisDirection: AxisDirection.down,
                        color: Theme.of(context).primaryColor,
                        child: ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return TaskCard(
                              title: tasks[index].title,
                              time: tasks[index].time,
                              description: tasks[index].description,
                            );
                          },
                        ),
                      ),
                    )
                  : Center(
                      child: Container(
                        child: Text(
                          "There is nothing here yet...",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: FloatingButton(context: context),
        ),
      ],
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget empty() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Align(
        alignment: Alignment.center,
        child: Text("There was an error!"),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(LoadAllTasks());
    super.initState();
  }
}
