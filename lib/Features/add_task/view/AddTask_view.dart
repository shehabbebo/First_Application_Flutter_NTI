import 'dart:io';
import 'package:ToDoApp/Features/add_task/data/models/category_model.dart';
import 'package:ToDoApp/Features/add_task/manager/add_task_cubit/add_task_cubit.dart';
import 'package:ToDoApp/Features/add_task/manager/add_task_cubit/add_task_state.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:ToDoApp/core/widgets/Custom_Text_filed.dart';
import 'package:ToDoApp/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTask_view extends StatelessWidget {
  const AddTask_view({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is AddTaskSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Task Added')));
          }
        },
        builder: (context, state) {
          var cubit = AddTaskCubit.get(context);

          return Scaffold(
            backgroundColor: AppColor.ScaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColor.ScaffoldBackgroundColor,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                "Add Task",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => cubit.pickImage(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child:
                            cubit.image != null
                                ? Image.file(
                                  File(cubit.image!.path),
                                  height: 207,
                                  width: 207,
                                  fit: BoxFit.cover,
                                )
                                : Image.asset(
                                  AppAssets.logo,
                                  height: 207,
                                  width: 207,
                                  fit: BoxFit.cover,
                                ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    CustomTextFormFiled(
                      controller: AddTaskCubit.get(context).titleController,
                      backgroundColor: AppColor.white,
                      hintText: 'Title',
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter title'
                                  : null,
                    ),
                    const SizedBox(height: 15),

                    CustomTextFormFiled(
                      controller:
                          AddTaskCubit.get(context).descriptionController,
                      backgroundColor: AppColor.white,
                      hintText: 'Description',
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please enter description'
                                  : null,
                    ),
                    const SizedBox(height: 15),

                    SizedBox(
                      width: 431,
                      child: DropdownButtonFormField<CategoryModel>(
                        value: cubit.group,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.white,
                          hintText: "Select Group",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColor.primaryColor,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          isDense: true,
                        ),
                        items:
                            cubit.categories.map((category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      category.imagePath,
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(category.title),
                                  ],
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            cubit.changeGroup(value);
                          }
                        },
                        validator:
                            (value) =>
                                value == null ? 'Please select a group' : null,
                      ),
                    ),
                    const SizedBox(height: 15),

                    GestureDetector(
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          cubit.changeEndDate(pickedDate);
                        }
                      },
                      child: AbsorbPointer(
                        child: CustomTextFormFiled(
                          controller: cubit.endDateController,
                          backgroundColor: AppColor.white,
                          hintText: 'End Date',
                          prefixIcon: Image.asset(
                            'assets/images/calendar.png',
                            width: 10,
                            height: 10,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter end date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    state is AddTaskLoadingState
                        ? const CircularProgressIndicator()
                        : CustomBottom(
                          text: "Add  Task",
                          height: 50,
                          onPressed: () {
                            print("pressed");
                            cubit.onAddTaskPressed();
                          },
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
