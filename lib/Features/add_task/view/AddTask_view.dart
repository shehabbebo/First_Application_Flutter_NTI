import 'package:flutter/material.dart';
import 'package:two_day_flutter/Features/add_task/view/edit_task.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/Custom_Text_filed.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';

class AddTask_view extends StatefulWidget {
  const AddTask_view({super.key});

  @override
  State<AddTask_view> createState() => _AddTask_viewState();
}

class _AddTask_viewState extends State<AddTask_view> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  String? selectedGroup;
  List<String> groups = ['Home', 'Personal', 'Work'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.ScaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // الرجوع للصفحة السابقة
          },
        ),
        title: const Text("Add Task", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 207,
                  width: 207,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),

              CustomTextFormFiled(
                controller: titleController,
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
                controller: descriptionController,
                backgroundColor: AppColor.white,
                hintText: 'Description',
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Please enter description'
                            : null,
              ),
              const SizedBox(height: 15),

              GestureDetector(
                onTap: () async {
                  final selected = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            groups.map((group) {
                              String imagePath;
                              switch (group) {
                                case 'Home':
                                  imagePath = 'assets/images/house.png';
                                  break;
                                case 'Personal':
                                  imagePath = 'assets/images/personal.png';
                                  break;
                                case 'Work':
                                  imagePath = 'assets/images/work.png';
                                  break;
                                default:
                                  imagePath = AppAssets.logo;
                              }

                              return ListTile(
                                leading: Image.asset(
                                  imagePath,
                                  width: 24,
                                  height: 24,
                                ),
                                title: Text(group),
                                onTap: () => Navigator.pop(context, group),
                              );
                            }).toList(),
                      );
                    },
                  );
                  if (selected != null) {
                    setState(() {
                      selectedGroup = selected;
                    });
                  }
                },
                child: AbsorbPointer(
                  child: CustomTextFormFiled(
                    controller: TextEditingController(
                      text: selectedGroup ?? '',
                    ),
                    backgroundColor: AppColor.white,
                    hintText: 'Group',
                    suffixIcon: Image.asset(
                      'assets/images/Arrow_back.png',
                      width: 5,
                      height: 5,
                    ),
                    validator: (value) {
                      if (selectedGroup == null) {
                        return 'Select a group';
                      }
                      return null;
                    },
                  ),
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
                    endTimeController.text =
                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                  }
                },
                child: AbsorbPointer(
                  child: CustomTextFormFiled(
                    controller: endTimeController,
                    backgroundColor: AppColor.white,
                    hintText: 'End Time',
                    prefixIcon: Image.asset(
                      'assets/images/calendar.png',
                      width: 10,
                      height: 10,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter end time';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

              CustomBottom(
                text: "Add Task",
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => EditTaskView(
                              title: titleController.text,
                              description: descriptionController.text,
                              group: selectedGroup ?? '',
                              date: endTimeController.text,
                            ),
                      ),
                    );
                  }
                },
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
