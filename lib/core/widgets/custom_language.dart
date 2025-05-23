import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:flutter/material.dart';

class CustomLanguageContainer {
  static Widget getCustomLanguageContainer({
    required Color backgroundColor,
    Color textColor = AppColor.white,
    required String text,
    BorderRadius? borderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 18,
          vertical: 8,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
