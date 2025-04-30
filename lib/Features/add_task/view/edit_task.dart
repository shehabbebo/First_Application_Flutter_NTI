import 'package:flutter/material.dart';
import 'package:two_day_flutter/Features/add_task/view/edit_task_done.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/core/utils/custom_text_filed.dart';

class EditTaskView extends StatelessWidget {
  final String title;
  final String description;
  final String group;
  final String date;

  const EditTaskView({
    super.key,
    required this.title,
    required this.description,
    required this.group,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController(text: title);
    final descriptionController = TextEditingController(text: description);
    final groupController = TextEditingController(text: group);
    final dateController = TextEditingController(text: date);

    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.ScaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Edit Task', style: TextStyle(color: Colors.black)),
        leading: const BackButton(color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Chip(
              backgroundColor: Colors.red,
              label: Row(
                children: [
                  Icon(Icons.delete, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text('Delete', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        ' In Progress',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        " Believe you can, and you're\n halfway there.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextFormFiled(
                backgroundColor: AppColor.white,
                prefixIcon: Image.asset('assets/images/house.png', height: 2),

                controller: groupController,
                hintText: 'Group',
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter group'
                            : null,
              ),
              const SizedBox(height: 15),
              CustomTextFormFiled(
                controller: titleController,
                hintText: 'Title',
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter title'
                            : null,
              ),
              const SizedBox(height: 15),
              CustomTextFormFiled(
                controller: descriptionController,
                hintText: 'Description',

                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter description'
                            : null,
              ),
              const SizedBox(height: 15),
              CustomTextFormFiled(
                controller: dateController,
                hintText: '30 June, 2022   10:00 pm',
                prefixIcon: Image.asset('assets/images/calendar.png'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter date'
                            : null,
              ),
              const SizedBox(height: 30),
              CustomBottom(
                text: "Mark as Done",
                height: 50,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const EditTaskDoneView(
                              title: '',
                              description: '',
                              group: '',
                              date: '',
                            ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 15),
              CustomBottom(
                text: "Update",
                height: 50,
                // isOutlined: true,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
