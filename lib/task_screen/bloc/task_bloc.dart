import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schedule_tasks/const.dart';
import 'package:schedule_tasks/models/task_model.dart';
import 'package:schedule_tasks/services/local_data_source.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoading());

  LocalDataSource _localDataSource = LocalDataSource();
  DateTime _dateTime = DateTime.now();
  List<Task> _tasks = [];

  List<Task> _filter() {
    List<Task> filtered = [];
    String weekDay = weekDaysShort[_dateTime.weekday - 1];
    for (int i = 0; i <= _tasks.length - 1; i++) {
      for (int j = 0; j <= _tasks[i].weekDays.length - 1; j++) {
        if (weekDay == _tasks[i].weekDays[j]) {
          filtered.add(_tasks[i]);
          break;
        }
      }
    }
    return filtered;
  }

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is LoadAllTasks) {
      try {
        yield TaskLoading();
        _tasks = await _localDataSource.getTasks();
        yield MainScreen(tasks: _filter(), date: _dateTime);
      } on CacheException {
        // yield EmptyScreen();
        yield MainScreen(tasks: _filter(), date: _dateTime);
      }
    } else if (event is DisplayAddTaskScreen) {
      yield AddScreen();
      _filter();
    } else if (event is AddNewTask) {
      _tasks.add(event.task);
      _localDataSource.cacheData(_tasks);
      yield MainScreen(tasks: _filter(), date: _dateTime);
    }
  }
}
