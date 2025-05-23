import 'package:ToDoApp/Features/add_task/data/models/category_model.dart';
import 'package:ToDoApp/Features/add_task/data/models/get_tasks_response_model.dart';
import 'package:ToDoApp/Features/add_task/data/repo/task_repo.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());
  static AddTaskCubit get(context) => BlocProvider.of(context);
  TasksRepo tasksRepo = TasksRepo();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? endDate;

  CategoryModel? group;

  List<CategoryModel> categories = [
    CategoryModel(
      title: 'Home',

      imagePath: AppAssets.house,
      bgColor: AppColor.black,
    ),
    CategoryModel(
      title: 'Personal',

      imagePath: AppAssets.personal,
      bgColor: AppColor.black,
    ),
    CategoryModel(
      title: 'Work',

      imagePath: AppAssets.work,
      bgColor: AppColor.black,
    ),
  ];

  void changeEndDate(DateTime date) {
    endDate = date;
    endDateController.text = "${date.year}-${date.month}-${date.day}";
    emit(AddTaskChangeEndDateState());
  }

  void changeGroup(CategoryModel group) {
    this.group = group;
    emit(AddTaskChangeGroupState());
  }

  XFile? image;
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(AddTaskChangeImageState());
  }

  void onAddTaskPressed() async {
    print("pressed2");
    if (!formKey.currentState!.validate()) return;
    emit(AddTaskLoadingState());
    var result = await tasksRepo.addTask(
      task: TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        image: image,
      ),
    );
    result.fold(
      (error) {
        emit(AddTaskErrorState(error: error));
      },
      (message) {
        emit(AddTaskSuccessState(message: message));
      },
    );
  }
}
