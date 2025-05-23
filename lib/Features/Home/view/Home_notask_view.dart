import 'package:ToDoApp/Features/Auth/view/log_in_view.dart';
import 'package:ToDoApp/Features/Home/cubit/home_notask/home_cubit.dart';
import 'package:ToDoApp/Features/Home/cubit/home_notask/home_state.dart';
import 'package:ToDoApp/Features/add_task/data/models/get_tasks_response_model.dart';
import 'package:ToDoApp/Features/add_task/manager/get_tasks/get_task_cubit.dart';
import 'package:ToDoApp/Features/add_task/view/edit_task.dart';
import 'package:ToDoApp/core/helper/my_navigator.dart';
import 'package:ToDoApp/core/helper/my_responsive.dart';
import 'package:ToDoApp/core/translation/translation_keys.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:ToDoApp/core/utils/string.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Home_notask_view extends StatelessWidget {
  const Home_notask_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: MyResponsive.height(context, value: 80),
        title: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserGetError) {
              MyNavigator.goTo(screen: Login_view(), isReplace: true);
            }
          },
          builder: (context, state) {
            return Row(
              children: [
                InkWell(
                  onTap:
                      () => Navigator.pushNamed(context, Routes.Profile_view),
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(end: 16),
                    height: MyResponsive.height(context, value: 60),
                    width: MyResponsive.height(context, value: 60),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            state is UserGetSuccess &&
                                    state.userModel.imagePath != null
                                ? NetworkImage(state.userModel.imagePath!)
                                : const AssetImage(AppAssets.logo)
                                    as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TranslationKeys.hello.tr,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColor.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (state is UserGetSuccess)
                        Text(
                          state.userModel.username ?? 'No Name',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: AppColor.black,
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.AddTask_view,
                    );
                  },
                  icon: const Icon(Icons.add_box_outlined),
                ),
                const SizedBox(height: 90),
              ],
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => GetTaskCubit()..getTasksFromAPI(),
        child: BlocBuilder<GetTaskCubit, GetTaskState>(
          builder: (context, state) {
            if (state is GetTaskSuccess) {
              if (state.tasks.isEmpty) {
                return const Center(child: Text("There are no tasks yet,"));
              }
              return ListView.builder(
                itemBuilder:
                    (context, index) =>
                        TaskBuilder(taskModel: state.tasks[index]),
                itemCount: state.tasks.length,
              );
            } else if (state is GetTaskError) {
              return Center(child: Text(state.error));
            } else if (state is GetTaskLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class TaskBuilder extends StatelessWidget {
  const TaskBuilder({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    String iconPath;
    Color statusColor;
    String statusText;

    if (taskModel.title == 'Work Task') {
      iconPath = 'assets/images/work.png';
      statusColor = const Color.fromARGB(255, 16, 93, 53);
      statusText = 'In Progress';
    } else if (taskModel.title == 'Personal Task') {
      iconPath = 'assets/images/personal.png';
      statusColor = Colors.green;
      statusText = 'Done';
    } else {
      iconPath = 'assets/images/house.png';
      statusColor = Colors.red;
      statusText = 'Missed';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 115,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => EditTaskView(
                            taskId: taskModel.id ?? 0,
                            title: taskModel.title ?? "",
                            description: taskModel.description ?? "",
                            date: taskModel.date ?? "",
                            group: taskModel.group ?? "",
                          ),
                    ),
                  );

                  if (result != null) {
                    context.read<GetTaskCubit>().getTasksFromAPI();
                  }
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  ' ${taskModel.title}',
                  style: const TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  ' ${taskModel.description}',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Image.asset(iconPath, width: 20, height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
