import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/Custom_Text_filed.dart';
import 'package:two_day_flutter/core/utils/app_regex.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class AddTask_view extends StatefulWidget {
  const AddTask_view({super.key});

  @override
  State<AddTask_view> createState() => _AddTask_viewState();
}

class _AddTask_viewState extends State<AddTask_view> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.ScaffoldBackgroundColor,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.Profile_view);
              },
            ),
            SizedBox(width: 80),
            Title(
              color: Colors.black,
              child: Text("Add Task", style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
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
