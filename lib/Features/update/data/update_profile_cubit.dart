import 'package:ToDoApp/Features/update/data/update_profile_state.dart';
import 'package:ToDoApp/Features/update/manager/repo/update_user_repo.dart';
import 'package:ToDoApp/core/network/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  ApiHelper apiHelper = ApiHelper();
  UpdateUserProfileRepo updateProfileRepo = UpdateUserProfileRepo();
  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  XFile? image;

  void updateProfileBtn() async {
    if (formKey.currentState!.validate()) {
      emit(UpdateProfileLoadingState());
      var result = await updateProfileRepo.updateUserProfile(
        userName: userNameController.text,
        image: image,
      );
      result.fold(
        (String error) {
          emit(UpdateProfileErrorState(error: error));
        },
        (r) {
          emit(UpdateProfileSuccessState());
        },
      );
    }
  }
}
