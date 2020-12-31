import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_tasks/task_screen/bloc/task_bloc.dart';
import 'package:schedule_tasks/task_screen/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Schedule Task',
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.white54,
        textSelectionHandleColor: Colors.white54,
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.white54,
        ),
      ),
      home: BlocProvider<TaskBloc>(
          create: (_) => TaskBloc(), child: TaskScreen()),
    );
  }
}
