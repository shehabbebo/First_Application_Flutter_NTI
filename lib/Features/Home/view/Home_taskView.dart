import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class HomeTask_view extends StatelessWidget {
  const HomeTask_view({super.key});

  final List<Map<String, String>> tasks = const [
    {
      'title': 'My First Task',
      'description': 'Improve my English skills\n by trying to speek',
      'date': '11/03/2025',
      'time': '05:00 PM',
    },
    {
      'title': 'My Second Task',
      'description': 'Improve my English skills\n by trying to speek',
      'date': '11/03/2025',
      'time': '05:00 PM',
    },
    {
      'title': 'My Third Task',
      'description': 'Improve my English skills\n by trying to speek',
      'date': '11/03/2025',
      'time': '05:00 PM',
    },
    {
      'title': 'My Fourth Task',
      'description': 'Improve my English skills\n by trying to speek',
      'date': '11/03/2025',
      'time': '05:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.Profile_view,
                      );
                    },
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage('assets/images/logo.jpg'),
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_box_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  const Text(
                    "Tasks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 8),

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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xffCEEBDC),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                task['title']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                '${task['date']} \n${task['time']}',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            task['description']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
