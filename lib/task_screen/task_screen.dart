import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_tasks/models/task_model.dart';
import 'package:schedule_tasks/services/local_data_source.dart';
import 'package:schedule_tasks/task_screen/bloc/task_bloc.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if(state is TaskLoading){
              return loading();
            }
            else if(state is TaskLoaded){
              return loaded(state.tasks, null);
            }
          },
        ),
      ),
    );
  }

  Widget loaded(List<Task> tasks, DateTime date) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Container(
            height: 50,
            child: Center(
              child: Text(
                "Wednesday 30.12.2020",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
