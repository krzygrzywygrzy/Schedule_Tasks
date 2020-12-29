import 'package:flutter/material.dart';
import 'package:schedule_tasks/task_screen/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule Task',
      home: TaskScreen(),
    );
  }


}

