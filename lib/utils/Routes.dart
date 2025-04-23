import 'package:flutter/material.dart';
import 'package:two_day_flutter/Home_Page.dart';
import 'package:two_day_flutter/Home_task.dart';
import 'package:two_day_flutter/Login_page.dart';
import 'package:two_day_flutter/add_task.dart';
import 'package:two_day_flutter/change_password.dart';
import 'package:two_day_flutter/datails.dart';
import 'package:two_day_flutter/lanuage.dart';
import 'package:two_day_flutter/sign_up.dart';
import 'package:two_day_flutter/splash.dart';
import 'package:two_day_flutter/start.dart';
import 'package:two_day_flutter/update_profile.dart';
import 'package:two_day_flutter/utils/string.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.Splash_page:
        return MaterialPageRoute(builder: (_) => Splash_page());
      case Routes.Start_page:
        return MaterialPageRoute(builder: (_) => Start_page());
      case Routes.LoginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.SignUp_page:
        return MaterialPageRoute(builder: (_) => SignUp_page());
      case Routes.HomePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.HomeTaskPage:
        return MaterialPageRoute(builder: (_) => HomeTaskPage());
      case Routes.Lanuage_page:
        return MaterialPageRoute(builder: (_) => Lanuage_page());
      case Routes.UpdateProfile:
        return MaterialPageRoute(builder: (_) => UpdateProfile());
      case Routes.ChangePassword:
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case Routes.Datails:
        return MaterialPageRoute(builder: (_) => Datails());
      case Routes.AddTask:
        return MaterialPageRoute(builder: (_) => AddTask());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('NO route ${settings.name} ')),
              ),
        );
    }
  }
}
