import 'package:flutter/material.dart';
import 'package:two_day_flutter/Custom_Text_filed.dart';
import 'package:two_day_flutter/app_regex.dart';
import 'package:two_day_flutter/custom_buttom.dart';
import 'package:two_day_flutter/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/logo.jpg',
                    height: 232,
                    width: 272,
                  ),
                ),
                SizedBox(height: 12),
                CustomTextFormFiled(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined, size: 18),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                CustomTextFormFiled(
                  controller: passwordController,
                  hintText: 'Password',
                  isObscureText: isPasswordHidden,
                  prefixIcon: const Icon(Icons.lock_outline_rounded, size: 18),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
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
                SizedBox(height: 12),
                CustomTextFormFiled(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  isObscureText: isConfirmPasswordHidden,
                  prefixIcon: const Icon(Icons.lock_outline_rounded, size: 18),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordHidden = !isConfirmPasswordHidden;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomBottom(
                  text: 'Sign Up',
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
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
                      'Already Have An Account? ',
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
                          MaterialPageRoute(
                            builder: (context) => SignUp_page(),
                          ),
                        );
                      },
                      child: Text(
                        ' Login?',
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
        ),
      ),
    );
  }
}
