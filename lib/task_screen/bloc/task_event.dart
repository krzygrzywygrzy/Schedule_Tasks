part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class AddNewTask extends TaskEvent {
  @override
  List<Object> get props => [];
}

class LoadAllTasks extends TaskEvent {
  @override
  List<Object> get props => [];
}

class DisplayAddTaskScreen extends TaskEvent {
  @override
  List<Object> get props => [];
}


