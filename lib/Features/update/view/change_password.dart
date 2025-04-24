import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/Custom_Text_filed.dart';
import 'package:two_day_flutter/core/utils/app_regex.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';

class ChangePassword_view extends StatefulWidget {
  const ChangePassword_view({super.key});

  @override
  State<ChangePassword_view> createState() => _ChangePassword_viewState();
}

class _ChangePassword_viewState extends State<ChangePassword_view> {
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
              child: Image.asset(AppAssets.logo, fit: BoxFit.fill),
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
