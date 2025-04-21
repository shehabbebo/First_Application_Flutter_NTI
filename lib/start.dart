import 'package:flutter/material.dart';
import 'package:two_day_flutter/Login_page.dart';
import 'package:two_day_flutter/custom_buttom.dart';
import 'package:two_day_flutter/utils/App_color.dart';

class Start_page extends StatelessWidget {
  const Start_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .45,
            width: double.infinity,
            child: Center(
              child: Center(
                child: Image.asset('assets/images/start.png', fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Welcome To \n     Do It !",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Ready to conquer your tasks? Let's Do \n                         It together.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff6E6A7C),
            ),
          ),
          SizedBox(height: 15),
          CustomBottom(
            text: "Let’s Start",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
