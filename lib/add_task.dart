import 'package:flutter/material.dart';
import 'package:two_day_flutter/Custom_Text_filed.dart';
import 'package:two_day_flutter/app_regex.dart';
import 'package:two_day_flutter/custom_buttom.dart';
import 'package:two_day_flutter/utils/App_color.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: 261,
                height: 207,
                child: Image.asset('assets/images/logo.jpg', fit: BoxFit.fill),
              ),
              SizedBox(height: 20),
              CustomTextFormFiled(
                backgroundColor: AppColor.white,
                controller: emailController,
                hintText: 'Title',

                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              CustomTextFormFiled(
                backgroundColor: AppColor.white,
                controller: emailController,
                hintText: 'Description',

                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomBottom(text: "Add Task", onPressed: () {}, height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
