abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

class LoginVisibilityState extends LoginState {}

class LoginGenderChangedState extends LoginState {}

class LoginAgreeTermsState extends LoginState {}
