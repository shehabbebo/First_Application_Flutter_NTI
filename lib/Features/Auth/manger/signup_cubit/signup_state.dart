import 'package:two_day_flutter/Features/Home/data/model/user_model.dart';

abstract class SignupState {}

class SignupInitState extends SignupState {}

class SignupLoadingState extends SignupState {}

class LoginSuccessState extends SignupState {}

class SignupErrorState extends SignupState {
  final String error;
  SignupErrorState(this.error);
}

class SignupVisibilityState extends SignupState {}

class SignupGenderChangedState extends SignupState {}

class SignupAgreeTermsState extends SignupState {}
