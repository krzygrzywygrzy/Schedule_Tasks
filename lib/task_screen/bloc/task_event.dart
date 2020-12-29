part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class AddNewTask extends TaskEvent {

  @override
  List<Object> get props => [];

}
