part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskLoading extends TaskState {
  @override
  List<Object> get props => [];
}

class MainScreen extends TaskState {
  MainScreen({@required this.tasks, @required this.date});
  final DateTime date;
  final List<Task> tasks;
  @override
  List<Object> get props => [tasks, date];
}

class AddScreen extends TaskState {
  @override
  List<Object> get props => [];
}
