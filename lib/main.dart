import 'package:flutter/material.dart';
import 'package:two_day_flutter/Login_page.dart';
import 'package:two_day_flutter/add_task.dart';
import 'package:two_day_flutter/change_password.dart';
import 'package:two_day_flutter/lanuage.dart';
import 'package:two_day_flutter/splash.dart';
import 'package:two_day_flutter/update_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Lanuage_page());
  }
}
