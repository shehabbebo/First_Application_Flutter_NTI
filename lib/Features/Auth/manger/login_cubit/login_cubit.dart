import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  String selectedGender = 'Male';
  bool agreeToTerms = false;

  void onLoginPressed() {
    if (!formkey.currentState!.validate()) {
      emit(LoginErrorState('Please complete the form correctly'));
    } else if (!agreeToTerms) {
      emit(LoginErrorState('You must agree to the terms'));
    } else {
      emit(LoginSuccessState());
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(LoginVisibilityState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(LoginVisibilityState());
  }

  void toggleAgreeToTerms() {
    agreeToTerms = !agreeToTerms;
    emit(LoginAgreeTermsState());
  }

  void changeGender(String gender) {
    selectedGender = gender;
    emit(LoginGenderChangedState());
  }
}
