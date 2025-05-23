import 'package:ToDoApp/Features/change_password/data/change_password_repo.dart';
import 'package:ToDoApp/Features/change_password/manger/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordInitialState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangePasswordInitialState());
  }

  void changePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState());

      final result = await ChangePasswordRepo().changePassword(
        currentPassword: currentPasswordController.text,
        newPassword: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      result.fold(
        (error) {
          emit(ChangePasswordErrorState(error));
        },
        (message) {
          emit(ChangePasswordSuccessState(message));
        },
      );
    }
  }
}
