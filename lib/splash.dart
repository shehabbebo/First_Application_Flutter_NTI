import 'package:flutter/material.dart';
import 'package:two_day_flutter/Login_page.dart';
import 'package:two_day_flutter/start.dart';
import 'package:two_day_flutter/utils/App_color.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({super.key});

  @override
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Start_page()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .50,
            width: double.infinity,
            child: Center(
              child: Image.asset('assets/images/Group.png', fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "TODO",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
