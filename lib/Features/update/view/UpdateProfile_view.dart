import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/Custom_Text_filed.dart';
import 'package:two_day_flutter/core/helper/app_regex.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';

class UpdateProfile_view extends StatefulWidget {
  const UpdateProfile_view({super.key});

  @override
  State<UpdateProfile_view> createState() => _UpdateProfile_viewState();
}

final TextEditingController userNameController = TextEditingController();

class _UpdateProfile_viewState extends State<UpdateProfile_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            width: double.infinity,
            child: Image.asset(AppAssets.logo, fit: BoxFit.fill),
          ),
          SizedBox(height: 15),

          CustomTextFormFiled(
            backgroundColor: AppColor.white,
            controller: userNameController,
            hintText: 'User Name',
            prefixIcon: const Icon(Icons.person, size: 18),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username';
              }
              if (value.length < 3) {
                return 'Username must be at least 3 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          CustomBottom(
            width: 440,
            text: "Update",

            onPressed: () {},
            height: 50,
          ),
        ],
      ),
    );
  }
}
