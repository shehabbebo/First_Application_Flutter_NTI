import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/Custom_Text_filed.dart';
import 'package:two_day_flutter/core/utils/app_regex.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';

class UpdateProfile_view extends StatelessWidget {
  const UpdateProfile_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            width: double.infinity,
            child: Image.asset('assets/images/logo.jpg', fit: BoxFit.fill),
          ),
          SizedBox(height: 15),
          CustomTextFormFiled(
            backgroundColor: AppColor.white,

            hintText: 'User Name',

            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          CustomBottom(
            text: "Update",
            onPressed: () {},
            height: 50,
            width: 331,
          ),
        ],
      ),
    );
  }
}
