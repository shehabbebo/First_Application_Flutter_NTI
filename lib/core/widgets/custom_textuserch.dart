import 'package:ToDoApp/core/helper/setSvg.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class TextUserNameFormField {
  static Widget getTextFormField({
    required TextEditingController emailController,
    FormFieldValidator<String>? validator,
    required String hintText,
    double radius = 15,
    double width = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primary, width: 2),
            borderRadius: BorderRadius.circular(radius),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(246, 152, 149, 161),
            fontWeight: FontWeight.w200,
          ),
          fillColor: const Color(0xffFFFFFF),
          filled: true,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: setSvgPicture(assetPath: AppAssets.profile),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(width: width),
          ),
        ),
      ),
    );
  }
}
