import 'package:ToDoApp/Features/Home/cubit/home_notask/home_state.dart';
import 'package:ToDoApp/Features/Home/data/model/respone_model.dart';
import 'package:ToDoApp/Features/Home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  HomeRepo repo = HomeRepo();
  static late String sharedImageOnAllScreens;

  get userModel => null;
  void getUserData({required UserModel user}) {
    emit(UserGetSuccess(userModel: user));
  }

  void getUserDataFromAPI() async {
    var response = await repo.getUserData();

    response.fold(
      (error) {
        emit(UserGetError(error: error));
      },
      (userModel) {
        emit(UserGetSuccess(userModel: userModel));
      },
    );
  }
}
