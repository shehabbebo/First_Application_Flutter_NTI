import 'package:ToDoApp/Features/Auth/view/log_in_view.dart';
import 'package:ToDoApp/Features/Auth/view/signup_view.dart';
import 'package:ToDoApp/Features/Home/view/Home_notask_view.dart';
import 'package:ToDoApp/Features/Home/view/Home_taskView.dart';
import 'package:ToDoApp/Features/Home/view/filtring_task.dart';
import 'package:ToDoApp/Features/Home/view/task_view.dart';
import 'package:ToDoApp/Features/add_task/view/AddTask_view.dart';
import 'package:ToDoApp/Features/change_password/view/change_password.dart';
import 'package:ToDoApp/Features/onBoarding/view/Splash_view.dart';
import 'package:ToDoApp/Features/onBoarding/view/Start_view.dart';
import 'package:ToDoApp/Features/profile/view/Profile_view.dart';
import 'package:ToDoApp/Features/setting/view/Lanuage_view.dart';
import 'package:ToDoApp/Features/update/view/UpdateProfile_view.dart';
import 'package:ToDoApp/core/utils/string.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.Splash_view:
        return MaterialPageRoute(builder: (_) => Splash_view());
      case Routes.Start_view:
        return MaterialPageRoute(builder: (_) => Start_view());
      case Routes.Login_view:
        return MaterialPageRoute(builder: (_) => Login_view());
      case Routes.signup_view:
        return MaterialPageRoute(builder: (_) => signup_view());
      case Routes.Home_notask_view:
        return MaterialPageRoute(builder: (_) => Home_notask_view());
      case Routes.HomeTask_view:
        return MaterialPageRoute(builder: (_) => HomeTask_view());
      case Routes.Lanuage_view:
        return MaterialPageRoute(builder: (_) => Lanuage_view());
      case Routes.UpdateProfile_view:
        return MaterialPageRoute(builder: (_) => UpdateProfile_view());
      case Routes.ChangePassword_view:
        return MaterialPageRoute(builder: (_) => ChangePassword_view());
      case Routes.Profile_view:
        return MaterialPageRoute(builder: (_) => Profile_view());
      case Routes.AddTask_view:
        return MaterialPageRoute(builder: (_) => AddTask_view());
      case Routes.TasksPage_view:
        return MaterialPageRoute(builder: (_) => TasksPage_view());
      case Routes.FilterPage_view:
        return MaterialPageRoute(builder: (_) => FilterPage_view());

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
