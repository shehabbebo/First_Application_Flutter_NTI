import 'package:ToDoApp/Features/Auth/view/log_in_view.dart';
import 'package:ToDoApp/Features/onBoarding/view/Start_view.dart';
import 'package:ToDoApp/core/cashe/cache_data.dart';
import 'package:ToDoApp/core/cashe/cache_helper.dart';
import 'package:ToDoApp/core/cashe/cache_keys.dart';
import 'package:ToDoApp/core/constant/app_constant.dart';
import 'package:ToDoApp/core/helper/my_navigator.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:flutter/material.dart';

class Splash_view extends StatefulWidget {
  const Splash_view({super.key});

  @override
  State<Splash_view> createState() => _Splash_viewState();
}

class _Splash_viewState extends State<Splash_view> {
  @override
  void initState() {
    navigate(context);
    super.initState();
  }

  void navigate(context) {
    Future.delayed(Duration(seconds: 2), () {
      // navigate to lets start view
      CacheData.firstTime = CacheHelper.getData(key: CacheKeys.firstTime);
      if (CacheData.firstTime != null) {
        // goto login
        MyNavigator.goTo(screen: () => Login_view(), isReplace: true);
      } else // first time
      {
        MyNavigator.goTo(screen: () => Start_view(), isReplace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo as svg
            // CustomSvg(
            //   path: AppAssets.logo,
            //   width: MediaQuery.of(context).size.width * 0.9,
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .50,
              width: double.infinity,
              child: Center(
                child: Image.asset(AppAssets.Group, fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 44),
            // Text as app name
            Text(
              AppConstants.appName,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
