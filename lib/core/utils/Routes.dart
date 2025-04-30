import 'package:flutter/material.dart';
import 'package:two_day_flutter/Features/Home/view/Home_notask_view.dart';
import 'package:two_day_flutter/Features/Home/view/Home_taskView.dart';
import 'package:two_day_flutter/Features/Auth/view/Login_page.dart';
import 'package:two_day_flutter/Features/Home/view/filtring_task.dart';
import 'package:two_day_flutter/Features/Home/view/task_view.dart';
import 'package:two_day_flutter/Features/add_task/view/AddTask_view.dart';
import 'package:two_day_flutter/Features/add_task/view/edit_task.dart';
import 'package:two_day_flutter/Features/add_task/view/edit_task_done.dart';
import 'package:two_day_flutter/Features/update/view/change_password.dart';
import 'package:two_day_flutter/Features/update/view/Profile_view.dart';
import 'package:two_day_flutter/Features/update/view/Lanuage_view.dart';
import 'package:two_day_flutter/Features/Auth/view/sign_up.dart';
import 'package:two_day_flutter/Features/onBoarding/view/Splash_view.dart';
import 'package:two_day_flutter/Features/onBoarding/view/Start_view.dart';
import 'package:two_day_flutter/Features/update/view/UpdateProfile_view.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class AppRouter {
  Route generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.Splash_view:
        return MaterialPageRoute(builder: (_) => Splash_view());
      case Routes.Start_view:
        return MaterialPageRoute(builder: (_) => Start_view());
      case Routes.LoginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.SignUp_page:
        return MaterialPageRoute(builder: (_) => SignUp_page());
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
      // case Routes.EditTaskView:
      //   return MaterialPageRoute(
      //     builder: (context) => EditTaskView.fromRoute(context),
      //   );

      // case Routes.EditTaskDoneView:
      //   return MaterialPageRoute(
      //     builder: (context) => EditTaskDoneView.fromRoute(context),
      //   );
      // case Routes.EditTaskView:
      //   return MaterialPageRoute(
      //     builder:
      //         (context) =>
      //             EditTaskView.fromRoute(ModalRoute.of(context)!.settings),
      //   );

      // case Routes.EditTaskDoneView:
      //   return MaterialPageRoute(
      //     builder:
      //         (context) =>
      //             EditTaskDoneView.fromRoute(ModalRoute.of(context)!.settings),
      //   );

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
