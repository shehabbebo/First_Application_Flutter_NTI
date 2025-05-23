import 'package:ToDoApp/Features/add_task/data/repo/task_repo.dart';
import 'package:ToDoApp/Features/add_task/manager/delet_task/delet_task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());
  static DeleteTaskCubit get(context) => BlocProvider.of(context);
  static late int idTask;
  TasksRepo tasksRepo = TasksRepo();
  onDeleteBtnPressed(int? taskId) async {
    emit(DeleteTaskLoading());
    var result = await tasksRepo.deleteTask(taskId: taskId!);
    result.fold(
      (error) {
        emit(DeleteTaskError(error: error));
      },
      (message) {
        emit(DeleteTaskSuccess(message: message));
      },
    );
  }
}
