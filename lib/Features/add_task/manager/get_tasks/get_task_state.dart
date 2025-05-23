part of 'get_task_cubit.dart';

@immutable
abstract class GetTaskState {}

class GetTaskInitial extends GetTaskState {}

class GetTaskLoading extends GetTaskState {}

class GetTaskSuccess extends GetTaskState {
  final List<TaskModel> tasks;
  GetTaskSuccess(this.tasks);
}

class GetTaskError extends GetTaskState {
  final String error;
  GetTaskError(this.error);
}
