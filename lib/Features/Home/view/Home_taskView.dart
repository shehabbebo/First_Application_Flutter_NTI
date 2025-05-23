import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:ToDoApp/core/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTask_view extends StatelessWidget {
  const HomeTask_view({super.key});

  final List<Map<String, String>> tasks = const [
    {'title': 'Work Task', 'description': 'Add New Features'},
    {
      'title': 'Personal Task',
      'description': 'Improve my English skills by trying to speak',
    },
    {
      'title': 'Home Task',
      'description': 'Add new feature for Do It app and commit it',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(AppAssets.logo),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello!",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          "shehab",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Container(
                  height: 137,
                  width: 335,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Your today's tasks\n almost done!",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            "80%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xFF199A8E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.TasksPage_view,
                              );
                            },
                            child: const Text("View Tasks"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    const Text(
                      "In Progress",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffCEEBDC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tasks.length.toString(),
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                SizedBox(
                  height: 90,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: tasks.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      Color cardColor;
                      String imagePath;

                      if (task['title'] == 'Work Task') {
                        cardColor = Colors.black;
                        imagePath = 'assets/images/Bag.svg';
                      } else if (task['title'] == 'Personal Task') {
                        cardColor = Color(0xffCEEBDC);
                        imagePath = 'assets/images/person.svg';
                      } else {
                        cardColor = Color(0xffFFE4F2);
                        imagePath = 'assets/images/house.svg';
                      }

                      return Container(
                        width: 234,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  task['title'] ?? '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        task['title'] == 'Work Task'
                                            ? Colors.white
                                            : Colors.black54,
                                  ),
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  imagePath,
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                task['description'] ?? '',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      task['title'] == 'Work Task'
                                          ? Colors.white
                                          : Colors.black87,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Task Groups",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),

                Column(
                  children: [
                    _buildTaskGroup(
                      imagePath: 'assets/images/person.svg',
                      title: "Personal Task",
                      count: 5,
                    ),
                    const SizedBox(height: 12),
                    _buildTaskGroup(
                      imagePath: 'assets/images/house.svg',
                      title: "Home Task",
                      count: 3,
                    ),
                    const SizedBox(height: 12),
                    _buildTaskGroup(
                      imagePath: 'assets/images/Bag.svg',
                      title: "Work Task",
                      count: 1,
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeTask_view(),
                          ),
                        );
                      },
                      child: Image.asset(AppAssets.Add, width: 50, height: 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskGroup({
    required String imagePath,
    required String title,
    required int count,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(imagePath, width: 24, height: 24, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xffCEEBDC),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(count.toString(), style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
