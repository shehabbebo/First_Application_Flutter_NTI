import 'package:ToDoApp/Features/Auth/view/signup_view.dart';
import 'package:ToDoApp/core/cashe/cache_helper.dart';
import 'package:ToDoApp/core/cashe/cache_keys.dart';
import 'package:ToDoApp/core/constant/app_constant.dart';
import 'package:ToDoApp/core/helper/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:ToDoApp/core/widgets/custom_buttom.dart';

class Start_view extends StatelessWidget {
  const Start_view({super.key});

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
                child: Image.asset(AppAssets.Start, fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Welcome To \n     Do It !",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: AppConstants.fontFamily,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Ready to conquer your tasks? Let's Do \n                         It together.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppConstants.fontFamily,
              color: Color(0xff6E6A7C),
            ),
          ),
          SizedBox(height: 15),
          CustomBottom(
            text: "Let’s Start",

            onPressed: () async {
              await CacheHelper.saveData(
                key: CacheKeys.firstTime,
                value: false,
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => signup_view()),
              // );
              MyNavigator.goTo(screen: () => signup_view(), isReplace: true);
            },
          ),
        ],
      ),
    );
  }
}
