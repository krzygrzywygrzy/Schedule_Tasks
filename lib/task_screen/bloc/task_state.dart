part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskLoading extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoaded extends TaskState {
  TaskLoaded({this.tasks, this.date});
  final DateTime date;
  final List<Task> tasks;
  @override
  List<Object> get props => [tasks, date];
}