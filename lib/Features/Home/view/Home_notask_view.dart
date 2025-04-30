import 'package:flutter/material.dart';
import 'package:two_day_flutter/Features/Home/view/Home_taskView.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/App_constant.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class Home_notask_view extends StatelessWidget {
  const Home_notask_view({super.key});

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
                      backgroundImage: AssetImage(AppAssets.logo),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello!",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.AddTask_view,
                      );
                    },
                    icon: const Icon(Icons.add_box_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 70),

              const Center(
                child: Column(
                  children: [
                    Text(
                      "There are no tasks yet,",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: AppConstants.fontFamily,
                      ),
                    ),
                    Text(
                      "Press the button",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: AppConstants.fontFamily,
                      ),
                    ),
                    Text(
                      "To add New Task",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: AppConstants.fontFamily,
                      ),
                    ),
                    SizedBox(height: 40),
                    Image(image: AssetImage(AppAssets.Task), height: 268),
                  ],
                ),
              ),
              SizedBox(height: 90),
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
    );
  }
}
