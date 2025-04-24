import 'package:flutter/material.dart';
import 'package:two_day_flutter/Features/Auth/view/Login_page.dart';
import 'package:two_day_flutter/Features/onBoarding/view/Start_view.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';

class Splash_view extends StatefulWidget {
  const Splash_view({super.key});

  @override
  State<Splash_view> createState() => _Splash_viewState();
}

class _Splash_viewState extends State<Splash_view> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Start_view()),
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
              child: Image.asset(AppAssets.Group, fit: BoxFit.fill),
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
