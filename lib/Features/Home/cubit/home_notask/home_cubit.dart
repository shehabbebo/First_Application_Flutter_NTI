import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:two_day_flutter/Features/Home/cubit/home_notask/home_state.dart';
import 'package:two_day_flutter/Features/Home/data/model/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  void getUserData({required UserModel user}) {
    emit(UserGetSuccess(userModel: user));
  }
}
