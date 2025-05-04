import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_day_flutter/Features/Home/data/model/user_model.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitState());

  static SignupCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  String selectedGender = 'Male';
  bool agreeToTerms = false;

  void onsignUpPressed() {
    if (!formkey.currentState!.validate()) {
      emit(SignupErrorState('Please complete the form correctly'));
    } else if (!agreeToTerms) {
      emit(SignupErrorState('You must agree to the terms'));
    } else {
      emit(LoginSuccessState());
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(SignupVisibilityState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(SignupVisibilityState());
  }

  void toggleAgreeToTerms() {
    agreeToTerms = !agreeToTerms;
    emit(SignupAgreeTermsState());
  }

  void changeGender(String gender) {
    selectedGender = gender;
    emit(SignupGenderChangedState());
  }
}
