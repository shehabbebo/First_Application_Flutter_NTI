import 'package:ToDoApp/Features/add_task/data/repo/task_repo.dart';
import 'package:ToDoApp/Features/add_task/manager/update_task/update_task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitialState());

  static EditTaskCubit get(context) => BlocProvider.of(context);

  static late TextEditingController InitialTitleController;
  static late TextEditingController InitialDescriptionController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController(
    text: InitialTitleController.text,
  );
  TextEditingController descriptionController = TextEditingController(
    text: InitialDescriptionController.text,
  );

  TasksRepo tasksRepo = TasksRepo();
  static late int id;

  onUpDateBtnPressed(int? taskId, BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    emit(EditTaskLoadingState());

    var result = await tasksRepo.updateTask(
      title: titleController.text,
      description: descriptionController.text,
      taskId: taskId!,
    );
    result.fold(
      (error) {
        emit(EditTaskErrorState(error: error));
      },
      (message) {
        emit(EditTaskSuccessState(message: message));
        // تحديث قائمة المهام بعد التعديل
        Navigator.pop(context, true);
      },
    );
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
