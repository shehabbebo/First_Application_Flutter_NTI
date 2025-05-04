import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_day_flutter/Features/Auth/manger/log_in/login_state.dart';
import 'package:two_day_flutter/Features/Home/data/model/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  void onLoginPressed() {
    if (!formkey.currentState!.validate()) {
      emit(LoginErrorState('Please complete the form correctly'));
    } else {
      UserModel userModel = UserModel(userName: userNameController.text);
      emit(LoginSuccessState(userModel));
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(LoginVisibilityState());
  }
}
