import 'package:flutter/material.dart';

class CategoryModel {
  String title;
  //Icon icon;
  String imagePath; // بدل Icon
  Color bgColor;
  CategoryModel({
    required this.title,
    //required this.icon,
    required this.imagePath,
    required this.bgColor,
  });
}
