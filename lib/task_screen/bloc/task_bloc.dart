import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schedule_tasks/models/task_model.dart';
import 'package:schedule_tasks/services/local_data_source.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoading());

  LocalDataSource _localDataSource = LocalDataSource();
  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if(event is LoadAllTasks){
      List<Task> tasks = await _localDataSource.getTasks();
      yield TaskLoaded(tasks: tasks);
    }
  }
}
