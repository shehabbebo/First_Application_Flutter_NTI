import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_day_flutter/Features/Auth/manger/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitState());

  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  void onsignUpPressed() {
    if (!formkey.currentState!.validate()) {
      emit(SignUpErrorState('Please complete the form correctly'));
    } else {
      emit(SignUpSuccessState());
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(SignUpVisibilityState());
  }
}
