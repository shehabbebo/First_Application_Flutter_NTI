import 'package:ToDoApp/Features/add_task/manager/delet_task/delet_task_cubit.dart';
import 'package:ToDoApp/Features/add_task/manager/delet_task/delet_task_state.dart';
import 'package:ToDoApp/Features/add_task/view/edit_task_done.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:ToDoApp/core/widgets/Custom_Text_filed.dart';
import 'package:ToDoApp/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditTaskView extends StatefulWidget {
  final String title;
  final String description;
  final String group;
  final String date;
  final int taskId;

  const EditTaskView({
    super.key,
    required this.title,
    required this.description,
    required this.group,
    required this.date,
    required this.taskId,
  });

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dateController;

  final List<String> groups = [
    'Work Task',
    'Personal Task',
    'Home Task',
    'Other',
  ];

  late String selectedGroup;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);

    try {
      selectedDate = DateFormat('dd MMM, yyyy   hh:mm a').parse(widget.date);
    } catch (e) {
      selectedDate = DateTime.now();
    }

    dateController = TextEditingController(text: widget.date);

    selectedGroup = groups.contains(widget.group) ? widget.group : groups[0];
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date == null) return;

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: selectedDate.hour,
        minute: selectedDate.minute,
      ),
    );

    if (time == null) return;

    final combined = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() {
      selectedDate = combined;
      dateController.text = DateFormat(
        'dd MMM, yyyy   hh:mm a',
      ).format(combined);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeleteTaskCubit(),
      child: BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
        listener: (context, state) {
          if (state is DeleteTaskSuccess) {
            Navigator.pop(context, true);
          } else if (state is DeleteTaskError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          final deleteCubit = DeleteTaskCubit.get(context);

          return Scaffold(
            backgroundColor: AppColor.ScaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColor.ScaffoldBackgroundColor,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                'Edit Task',
                style: TextStyle(color: Colors.black),
              ),
              leading: const BackButton(color: Colors.black),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap:
                        state is DeleteTaskLoading
                            ? null
                            : () {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      title: const Text('Confirm Delete'),
                                      content: const Text(
                                        'Are you sure you want to delete this task?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed:
                                              () => Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            deleteCubit.onDeleteBtnPressed(
                                              widget.taskId,
                                            );
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                              );
                            },
                    child: Chip(
                      backgroundColor:
                          state is DeleteTaskLoading ? Colors.grey : Colors.red,
                      label: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          const Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          ),
                          if (state is DeleteTaskLoading) ...[
                            const SizedBox(width: 8),
                            const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ],
                      ),
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
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'In Progress',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Believe you can, and you're\nhalfway there.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    DropdownButtonFormField<String>(
                      value: selectedGroup,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items:
                          groups.map((group) {
                            String imagePath = AppAssets.work;
                            if (group == 'Work Task') {
                              imagePath = AppAssets.personal;
                            } else if (group == 'Personal Task') {
                              imagePath = AppAssets.house;
                            } else if (group == 'Home Task') {
                              imagePath = AppAssets.work;
                            } else if (group == 'Other') {
                              imagePath = AppAssets.personal;
                            }

                            return DropdownMenuItem(
                              value: group,
                              child: Row(
                                children: [
                                  Image.asset(imagePath, height: 24),
                                  const SizedBox(width: 8),
                                  Text(group),
                                ],
                              ),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedGroup = value;
                          });
                        }
                      },
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Please select group'
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

                    TextFormField(
                      controller: dateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/calendar.png',
                            height: 24,
                          ),
                        ),
                        hintText: 'Select date & time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onTap: _pickDateTime,
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
                                  (context) => EditTaskDoneView(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    group: selectedGroup,
                                    date: dateController.text,
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context, {
                            'title': titleController.text,
                            'description': descriptionController.text,
                            'group': selectedGroup,
                            'date': dateController.text,
                          });
                        }
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
