import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:flutter/material.dart';

class CustomelEvatedbutton {
  static Widget getElevatedButton({
    required void Function() onTap,
    required String title,
    FontWeight fontWeight = FontWeight.w600,

    double fontSize = 22,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: AlignmentDirectional.center,
          backgroundColor: AppColor.primary,
          fixedSize: const Size(381, 48),
          foregroundColor: Colors.white,
          elevation: 20,
          shadowColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}

class CustomOutLinedelevatedbutton {
  static Widget getElevatedButton({
    required void Function() onTap,
    required String title,
    FontWeight fontWeight = FontWeight.w400,

    double fontSize = 19,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: AlignmentDirectional.center,
          backgroundColor: AppColor.white,
          fixedSize: const Size(381, 48),
          foregroundColor: AppColor.primary,
          elevation: 20,
          shadowColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: AppColor.primary),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
