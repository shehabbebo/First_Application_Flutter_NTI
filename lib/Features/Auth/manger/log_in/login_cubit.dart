import 'package:ToDoApp/Features/Auth/data/repo/auth_repo.dart';
import 'package:ToDoApp/Features/Auth/manger/log_in/login_state.dart';
import 'package:ToDoApp/Features/Home/data/model/respone_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  final AuthRepo authRepo = AuthRepo();

  void onLoginPressed() async {
    if (formkey.currentState!.validate()) {
      emit(LoginLoadingState());
      var result = await authRepo.login(
        username: userNameController.text,
        password: passwordController.text,
      );
      result.fold(
        (error) {
          emit(LoginErrorState(error));
        },
        (r) // right
        {
          final userModel = UserModel(username: userNameController.text);
          emit(LoginSuccessState(userModel));
        },
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(LoginVisibilityState());
  }
}
