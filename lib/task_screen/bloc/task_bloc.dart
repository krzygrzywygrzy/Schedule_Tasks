import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:schedule_tasks/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoading());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
