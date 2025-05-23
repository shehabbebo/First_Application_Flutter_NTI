import 'package:ToDoApp/Features/Home/data/model/respone_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserGetError extends UserState {
  String error;
  UserGetError({required this.error});
}

class UserGetSuccess extends UserState {
  UserModel userModel;
  UserGetSuccess({required this.userModel});
}
