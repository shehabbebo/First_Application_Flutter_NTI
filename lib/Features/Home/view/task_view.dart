import 'package:ToDoApp/Features/Home/view/filtring_task.dart';
import 'package:ToDoApp/core/utils/string.dart';
import 'package:flutter/material.dart';

class TasksPage_view extends StatefulWidget {
  const TasksPage_view({super.key});

  @override
  _TasksPage_viewState createState() => _TasksPage_viewState();
}

class _TasksPage_viewState extends State<TasksPage_view> {
  bool _isFilterVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.popAndPushNamed(context, Routes.HomeTask_view);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search . . .',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Results',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(), // ✅ مهم
                    children: [
                      taskCard(
                        title: 'Go to supermarket to buy some milk & eggs',
                        status: 'In Progress',
                        statusColor: const Color.fromARGB(255, 16, 93, 53),
                        iconPath: 'assets/images/work.png',
                        imagePath: 'assets/images/logo.jpg',
                      ),
                      taskCard(
                        title: 'Go to supermarket to buy some milk & eggs',
                        status: 'Done',
                        statusColor: Colors.green,
                        iconPath: 'assets/images/house.png',
                        imagePath: 'assets/images/logo.jpg',
                      ),
                      taskCard(
                        title: 'Add new feature for Do It app and commit it',
                        status: 'Done',
                        statusColor: Colors.green,
                        iconPath: 'assets/images/personal.png',
                        imagePath: 'assets/images/logo.jpg',
                      ),
                      taskCard(
                        title: 'Improve my English skills by trying to speak',
                        status: 'Missed',
                        statusColor: Colors.red,
                        iconPath: 'assets/images/house.png',
                        imagePath: 'assets/images/logo.jpg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          if (_isFilterVisible) Center(child: FilterPage_view()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _isFilterVisible = !_isFilterVisible;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget taskCard({
    required String title,
    required String status,
    required Color statusColor,
    required String iconPath,
    required String imagePath,
  }) {
    return SizedBox(
      height: 107,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Column(
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(title, style: const TextStyle(fontSize: 14)),
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
                      status,
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
    );
  }
}
