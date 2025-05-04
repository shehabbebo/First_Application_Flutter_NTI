import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:two_day_flutter/Features/add_task/data/models/category_model.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';

import 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());
  static AddTaskCubit get(context) => BlocProvider.of(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CategoryModel? group;
  void changeGroup(CategoryModel group) {
    this.group = group;
    emit(AddTaskChangeGroupState());
  }

  List<CategoryModel> categories = [
    CategoryModel(
      title: 'Home',
      //icon: Icon(Icons.home, color: Colors.pink),
      imagePath: AppAssets.house,
      bgColor: AppColor.black,
    ),
    CategoryModel(
      title: 'Personal',
      //icon: Icon(Icons.person, color: AppColor.primaryColor),
      imagePath: AppAssets.personal,
      bgColor: AppColor.black,
    ),
    CategoryModel(
      title: 'Work',
      // icon: Icon(Icons.work, color: AppColor.primaryColor),
      imagePath: AppAssets.work,
      bgColor: AppColor.black,
    ),
  ];

  DateTime? endDate;
  void changeEndDate(DateTime date) {
    endDate = date;
    endDateController.text = "${date.year}-${date.month}-${date.day}";
    emit(AddTaskChangeEndDateState());
  }

  XFile? image;
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    emit(AddTaskChangeImageState());
  }

  void onAddTaskPressed() {
    emit(AddTaskLoadingState());
    if (!formKey.currentState!.validate()) return;
    emit(AddTaskSuccessState());
  }
}
