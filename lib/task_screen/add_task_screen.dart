import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_tasks/const.dart';
import 'package:schedule_tasks/models/task_model.dart';
import 'package:schedule_tasks/widgets/day_button.dart';
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

  List<bool> selected = [false, false, false, false, false, false, false];

  List<Widget> _buildDayPicker() {
    List<Widget> list = [];
    for (int i = 0; i <= weekDaysShort.length - 1; i++) {
      list.add(
        Expanded(
          child: DayButton(
            id: i,
            label: weekDaysShort[i],
            toogle: (id) {
              selected[id] = !selected[id];
            },
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SingleChildScrollView(
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
                              BlocProvider.of<TaskBloc>(context)
                                  .add(LoadAllTasks());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white54,
                              ),
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
                        //INPUT TITLE
                        Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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

                        //INPUT DESCRIPTION
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
                              maxLines: 12,
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
                          height: 12,
                        ),

                        //DAYS PICKER
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: _buildDayPicker(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),

                        //TIME PICKERS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //SAVE BUTTON
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  List<String> days = [];
                  for (int i = 0; i <= weekDaysShort.length - 1; i++) {
                    if (selected[i]) days.add(weekDaysShort[i]);
                  }
                  BlocProvider.of<TaskBloc>(context).add(
                    AddNewTask(
                      task: Task(
                        title: title,
                        description: description != null ? description : "",
                        time: beginTime,
                        endTime: endTime,
                        weekDays: days,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        spreadRadius: 0.4,
                        blurRadius: 6,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
