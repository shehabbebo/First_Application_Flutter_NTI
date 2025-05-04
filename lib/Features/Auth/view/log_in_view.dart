import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_day_flutter/Features/Auth/manger/log_in/login_cubit.dart';
import 'package:two_day_flutter/Features/Auth/manger/log_in/login_state.dart';
import 'package:two_day_flutter/Features/Home/cubit/home_notask/home_cubit.dart';
import 'package:two_day_flutter/core/translation/translation_helper.dart';
import 'package:two_day_flutter/core/utils/App_assets.dart';
import 'package:two_day_flutter/core/utils/Custom_Text_filed.dart';
import 'package:two_day_flutter/Features/Auth/view/signup_view.dart';
import 'package:two_day_flutter/core/helper/app_regex.dart';
import 'package:two_day_flutter/core/utils/custom_buttom.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class Login_view extends StatelessWidget {
  const Login_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Sign Up Success')));
              UserCubit.get(context).getUserData(user: state.userModel);
              Navigator.pushReplacementNamed(context, Routes.Home_notask_view);
            } else if (state is LoginErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Form(
              key: cubit.formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.36,
                    width: double.infinity,
                    child: Image.asset(AppAssets.logo, fit: BoxFit.fill),
                  ),
                  SizedBox(height: 15),

                  CustomTextFormFiled(
                    backgroundColor: AppColor.white,
                    controller: cubit.userNameController,
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
                    controller: cubit.passwordController,
                    hintText: 'Password',
                    isObscureText: cubit.isPasswordHidden,
                    prefixIcon: const Icon(Icons.key, size: 18),
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        cubit.togglePasswordVisibility();
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
                    text: 'Log In',
                    height: 45,
                    width: 331,
                    onPressed: () {
                      cubit.onLoginPressed();
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomBottom(
                        text: 'Ar',
                        height: 70,
                        width: 70,
                        onPressed: () {
                          TranslationHelper.changeLanguage(true);
                        },
                      ),
                      CustomBottom(
                        text: 'en',
                        height: 70,
                        width: 70,
                        onPressed: () {
                          TranslationHelper.changeLanguage(false);
                        },
                      ),
                    ],
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
                            MaterialPageRoute(
                              builder: (context) => signup_view(),
                            ),
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
            );
          },
        ),
      ),
    );
  }
}
