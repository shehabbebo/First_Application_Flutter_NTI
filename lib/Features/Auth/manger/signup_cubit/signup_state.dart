abstract class SignupState {}

class SignupInitState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupErrorState extends SignupState {
  final String error;
  SignupErrorState(this.error);
}

class SignupVisibilityState extends SignupState {}

class SignupGenderChangedState extends SignupState {}

class SignupAgreeTermsState extends SignupState {}
