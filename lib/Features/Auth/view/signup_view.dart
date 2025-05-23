import 'dart:io';
import 'package:ToDoApp/Features/Auth/manger/signup_cubit/signup_cubit.dart';
import 'package:ToDoApp/Features/Auth/manger/signup_cubit/signup_state.dart';
import 'package:ToDoApp/Features/Auth/view/log_in_view.dart';
import 'package:ToDoApp/core/constant/app_constant.dart';
import 'package:ToDoApp/core/helper/app_regex.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/utils/App_color.dart';
import 'package:ToDoApp/core/utils/string.dart';
import 'package:ToDoApp/core/widgets/Custom_Text_filed.dart';
import 'package:ToDoApp/core/widgets/custom_buttom.dart';
import 'package:ToDoApp/core/widgets/image_manager/image_manager_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class signup_view extends StatelessWidget {
  const signup_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      body: BlocProvider(
        create: (context) => SignupCubit(),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccessState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Login Success')));

              Navigator.pushReplacementNamed(context, Routes.Login_view);
            } else if (state is SignupErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            var cubit = SignupCubit.get(context);
            return Form(
              key: cubit.formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ImageManagerView(
                      onPicked: (XFile image) {
                        SignupCubit.get(context).image = image;
                      },
                      pickedBody: (XFile image) {
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: FileImage(File(image.path)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      unPickedBody: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image.asset(
                          AppAssets.logo,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.36,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.36,
                    //   width: double.infinity,
                    //   child: Image.asset(AppAssets.logo, fit: BoxFit.fill),
                    // ),
                    // const SizedBox(height: 15),
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

                    const SizedBox(height: 12),

                    CustomTextFormFiled(
                      backgroundColor: AppColor.white,
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
                        if (value == null || !AppRegex.isPasswordValid(value)) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    CustomTextFormFiled(
                      backgroundColor: AppColor.white,
                      controller: cubit.confirmPasswordController,
                      hintText: 'Confirm Password',
                      isObscureText: cubit.isConfirmPasswordHidden,
                      prefixIcon: const Icon(Icons.key, size: 18),
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isConfirmPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          cubit.toggleConfirmPasswordVisibility();
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != cubit.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.white,
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
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          value: cubit.selectedGender,
                          items:
                              ['Male', 'Female', 'Other'].map((gender) {
                                return DropdownMenuItem<String>(
                                  value: gender,
                                  child: Text(gender),
                                );
                              }).toList(),
                          onChanged: (value) {
                            cubit.changeGender(value!);
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Checkbox(
                            value: cubit.agreeToTerms,
                            onChanged: (value) {
                              cubit.toggleAgreeToTerms();
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

                    const SizedBox(height: 10),

                    CustomBottom(
                      height: 45,
                      width: 331,
                      text: 'Sign Up',
                      onPressed: () {
                        cubit.onsignUpPressed();
                      },
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already Have An Account? ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppConstants.fontFamily,
                            color: const Color(0xff51526C),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login_view(),
                              ),
                            );
                          },
                          child: const Text(
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

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
