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
  List<Task> tasks = [];

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is LoadAllTasks) {
      try {
        yield TaskLoading();
        tasks = await _localDataSource.getTasks();
        yield MainScreen(tasks: tasks, date: dateTime);
      } on CacheException {
        // yield EmptyScreen();
        yield MainScreen(tasks: tasks, date: dateTime);
      }
    } else if (event is DisplayAddTaskScreen) {
      yield AddScreen();
    } else if (event is AddNewTask) {
      tasks.add(event.task);
      _localDataSource.cacheData(tasks);
      yield MainScreen(tasks: tasks, date: dateTime);
    }
  }
}
