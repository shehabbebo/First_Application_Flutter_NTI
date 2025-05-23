import 'package:ToDoApp/Features/Auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitState());

  static SignupCubit get(BuildContext context) => BlocProvider.of(context);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AuthRepo authRepo = AuthRepo();
  XFile? image;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  String selectedGender = 'Male';
  bool agreeToTerms = false;

  void onsignUpPressed() async {
    if (formkey.currentState!.validate()) {
      emit(SignupLoadingState());
      var result = await authRepo.register(
        username: userNameController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        image: image,
      );
      result.fold(
        (String error) // left
        {
          emit(SignupErrorState(error));
        },
        (r) // right
        {
          emit(SignupSuccessState());
        },
      );
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
