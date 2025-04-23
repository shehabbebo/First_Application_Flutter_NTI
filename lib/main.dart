import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/App_constant.dart';
import 'package:two_day_flutter/core/utils/Routes.dart';
import 'package:two_day_flutter/core/utils/string.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppConstants.fontFamily),
      onGenerateRoute: appRouter.generateRouter,
      initialRoute: Routes.Profile_view,
    );
  }
}
