import 'package:ToDoApp/Features/change_password/manger/change_password_cubit.dart';
import 'package:ToDoApp/Features/change_password/manger/change_password_state.dart';
import 'package:ToDoApp/Features/profile/view/Profile_view.dart';
import 'package:ToDoApp/core/translation/translation_keys.dart';
import 'package:ToDoApp/core/utils/App_assets.dart';
import 'package:ToDoApp/core/widgets/custom_circular_progress.dart';
import 'package:ToDoApp/core/widgets/custom_evaluted.dart';
import 'package:ToDoApp/core/widgets/custom_textuserch.dart';
import 'package:ToDoApp/core/widgets/customtext_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ChangePassword_view extends StatefulWidget {
  const ChangePassword_view({super.key});

  @override
  State<ChangePassword_view> createState() => _ChangePassword_viewState();
}

class _ChangePassword_viewState extends State<ChangePassword_view> {
  var MyNavigator;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordLoadingState) {
            return;
          } else if (state is ChangePasswordSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("User information updated successfully")),
            );
            // MyNavigator.goTo(screen: Profile_view(), isReplace: true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const Profile_view()),
            );
          } else if (state is ChangePasswordErrorState) {
            Get.snackbar(
              "Error",
              state.error,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Form(
              key: ChangePasswordCubit.get(context).formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 375,
                      width: double.infinity,
                      child: Image.asset(AppAssets.logo, fit: BoxFit.fill),
                    ),
                    const SizedBox(height: 23),
                    TextUserNameFormField.getTextFormField(
                      emailController:
                          ChangePasswordCubit.get(
                            context,
                          ).currentPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "old password cannot be empty";
                        }
                        return null;
                      },
                      hintText: TranslationKeys.oldPasswordTitle.tr,
                    ),
                    const SizedBox(height: 23),
                    TextFormPasswordField.getTextFormField(
                      passwordController:
                          ChangePasswordCubit.get(context).passwordController,
                      isPasswordVisible:
                          ChangePasswordCubit.get(context).isPasswordVisible,
                      onTap:
                          ChangePasswordCubit.get(
                            context,
                          ).togglePasswordVisibility,
                      hintText: TranslationKeys.newPasswordTitle.tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 23),
                    TextFormPasswordField.getTextFormField(
                      passwordController:
                          ChangePasswordCubit.get(
                            context,
                          ).confirmPasswordController,
                      isPasswordVisible:
                          ChangePasswordCubit.get(
                            context,
                          ).isConfirmPasswordVisible,
                      onTap:
                          ChangePasswordCubit.get(
                            context,
                          ).toggleConfirmPasswordVisibility,
                      hintText: TranslationKeys.confirmPassWordTitle.tr,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value !=
                                ChangePasswordCubit.get(
                                  context,
                                ).passwordController.text) {
                          return "Password cannot be empty and must match the new password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 23),
                    state is ChangePasswordLoadingState
                        ? CustomCircularProgressIndicator()
                        : CustomelEvatedbutton.getElevatedButton(
                          onTap:
                              ChangePasswordCubit.get(context).changePassword,
                          title: TranslationKeys.saveBtnTitle.tr,
                          fontWeight: FontWeight.w300,
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
