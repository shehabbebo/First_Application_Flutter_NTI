import 'package:flutter/material.dart';
import 'package:two_day_flutter/Custom_Text_filed.dart';
import 'package:two_day_flutter/app_regex.dart';
import 'package:two_day_flutter/custom_buttom.dart';
import 'package:two_day_flutter/utils/App_color.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      body: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.36,
              width: double.infinity,
              child: Image.asset('assets/images/logo.jpg', fit: BoxFit.fill),
            ),
            SizedBox(height: 20),
            CustomTextFormFiled(
              backgroundColor: AppColor.white,
              controller: passwordController,
              hintText: 'Old Password',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            CustomTextFormFiled(
              backgroundColor: AppColor.white,
              controller: passwordController,
              hintText: 'New Password',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            CustomTextFormFiled(
              backgroundColor: AppColor.white,
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),

            SizedBox(height: 15),
            CustomBottom(
              text: "Save",
              onPressed: () {},
              height: 48,
              width: 331,
            ),
          ],
        ),
      ),
    );
  }
}
