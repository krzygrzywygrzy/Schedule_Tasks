import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schedule_tasks/models/task_model.dart';
import 'package:schedule_tasks/services/local_data_source.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoading());

  LocalDataSource _localDataSource = LocalDataSource();
  DateTime dateTime = DateTime.now();

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if(event is LoadAllTasks){
      yield TaskLoading();
      List<Task> tasks = await _localDataSource.getTasks();
      yield MainScreen(tasks: tasks, date: dateTime);
    }
    if (event is DisplayAddTaskScreen){
      yield AddScreen();
    }
  }
}
