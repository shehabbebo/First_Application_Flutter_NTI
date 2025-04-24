import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/Custom_Text_filed.dart';
import 'package:two_day_flutter/core/utils/app_regex.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/Features/Auth/view/sign_up.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';
import 'package:two_day_flutter/core/utils/App_constant.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  String selectedGender = 'Male';
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.36,
                width: double.infinity,
                child: Image.asset(AppAssets.logo, fit: BoxFit.fill),
              ),
              SizedBox(height: 15),
              // CustomTextFormFiled(
              //   backgroundColor: AppColor.white,
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
                backgroundColor: AppColor.white,
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
              SizedBox(height: 12),
              CustomTextFormFiled(
                backgroundColor: AppColor.white,
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                isObscureText: isConfirmPasswordHidden,
                prefixIcon: const Icon(Icons.key, size: 18),
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

              SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.ScaffoldBackgroundColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.lightBlue.shade100,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: selectedGender,
                    items:
                        ['Male', 'Female', 'Other'].map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: 12),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Checkbox(
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Must Agree',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppConstants.fontFamily,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              CustomBottom(
                height: 45,
                width: 331,
                text: 'Sign Up',
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    if (!agreeToTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You must agree to the terms and conditions',
                          ),
                        ),
                      );
                      return;
                    }

                    print('Username: ${userNameController.text}');
                    print('Password: ${passwordController.text}');
                    print('Gender: $selectedGender');
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
                    'Already Have An Account? ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppConstants.fontFamily,
                      color: Color(0xff51526C),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp_page()),
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
    );
  }
}
