import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_tasks/widgets/time_picker.dart';
import 'bloc/task_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String title = "";
  String description = "";
  TimeOfDay beginTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<TaskBloc>(context).add(LoadAllTasks());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        cursorColor: Theme.of(context).accentColor,
                        onChanged: (value) {
                          title = value;
                        },
                        decoration: InputDecoration(
                          hintText: "Title",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorColor: Theme.of(context).accentColor,
                        minLines: 5,
                        maxLines: 5,
                        onChanged: (value) {
                          description = value;
                        },
                        decoration: InputDecoration(
                          hintText: "description",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TimePicker(
                    time: beginTime,
                    label: "from",
                    save: (newTime) {
                      setState(() {
                        if (newTime != null) beginTime = newTime;
                      });
                    },
                  ),
                  TimePicker(
                    time: endTime,
                    label: "to",
                    save: (newTime) {
                      setState(() {
                        if (newTime != null) endTime = newTime;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
