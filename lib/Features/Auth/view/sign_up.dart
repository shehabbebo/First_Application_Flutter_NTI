import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/Custom_Text_filed.dart';
import 'package:two_day_flutter/Features/Auth/view/Login_page.dart';
import 'package:two_day_flutter/core/utils/app_regex.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class SignUp_page extends StatefulWidget {
  const SignUp_page({super.key});

  @override
  State<SignUp_page> createState() => _SignUp_pageState();
}

class _SignUp_pageState extends State<SignUp_page> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

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
            SizedBox(height: 15),
            // CustomTextFormFiled(
            //   controller: emailController,
            //   hintText: 'Email',
            //   prefixIcon: const Icon(Icons.person, size: 18),
            //   validator: (value) {
            //     if (value == null ||
            //         value.isEmpty ||
            //         !AppRegex.isEmailValid(value)) {
            //       return 'Please enter a valid email';
            //     }
            //     return null;
            //   },
            // ),
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
            SizedBox(height: 12),
            CustomTextFormFiled(
              controller: passwordController,
              hintText: 'Password',
              isObscureText: isPasswordHidden,
              prefixIcon: const Icon(Icons.key, size: 18),
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),

            SizedBox(height: 20),
            CustomBottom(
              text: 'Sign Up',
              height: 45,
              width: 331,
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  print('Email: ${userNameController.text}');
                  print('Password: ${passwordController.text}');
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.Home_notask_view,
                  );
                } else {
                  print('Please fix the errors');
                }
              },
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t Have An Account ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff51526C),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    ' Register?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
