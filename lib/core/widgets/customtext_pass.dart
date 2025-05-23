import 'package:ToDoApp/core/helper/setSvg.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFormPasswordField {
  static Widget getTextFormField({
    required TextEditingController passwordController,
    required bool isPasswordVisible,
    required void Function() onTap,
    required String hintText,
    double radius = 15,
    double width = 1,
    FormFieldValidator<String>? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: !isPasswordVisible,
        controller: passwordController,
        validator: validator,
        decoration: InputDecoration(
          focusColor: AppColor.primary,

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primary, width: 2),
            borderRadius: BorderRadius.circular(radius),
          ),

          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(246, 152, 149, 161)),
          fillColor: const Color(0xffFFFFFF),
          filled: true,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.keyLogo),
          ),
          suffixIcon: IconButton(
            onPressed: onTap,
            icon: setSvgPicture(
              assetPath: isPasswordVisible ? AppAssets.unlock : AppAssets.lock,
              width: 24,
              height: 24,
            ),
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
