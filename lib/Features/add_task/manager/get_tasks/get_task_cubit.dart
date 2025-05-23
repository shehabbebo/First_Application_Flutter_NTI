import 'package:ToDoApp/Features/add_task/data/models/get_tasks_response_model.dart';
import 'package:ToDoApp/Features/add_task/data/repo/task_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit() : super(GetTaskInitial());

  static GetTaskCubit get(context) => BlocProvider.of<GetTaskCubit>(context);

  void getTasksFromAPI() async {
    emit(GetTaskLoading());
    var response = await TasksRepo().getTasks();
    response.fold(
      (error) {
        emit(GetTaskError(error));
      },
      (tasks) {
        emit(GetTaskSuccess(tasks));
      },
    );
  }
}
