abstract class SignUpState {}

class SignUpInitState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String error;
  SignUpErrorState(this.error);
}

class SignUpVisibilityState extends SignUpState {}
