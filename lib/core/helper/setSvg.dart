import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget setSvgPicture({
  required String assetPath,
  double width = 24,
  double height = 24,
  void Function()? onPressed,
  Color color = AppColor.black,
}) {
  return IconButton(
    onPressed: onPressed,

    icon: SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      color: color,
    ),
  );
}
