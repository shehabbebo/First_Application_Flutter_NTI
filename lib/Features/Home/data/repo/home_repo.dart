import 'package:ToDoApp/Features/Home/data/model/respone_model.dart';
import 'package:ToDoApp/core/network/api_helper.dart';
import 'package:ToDoApp/core/network/end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  // singleton
  static final HomeRepo _instance = HomeRepo._internal();
  factory HomeRepo() => _instance;
  HomeRepo._internal();
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, UserModel>> getUserData() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.getUserData,
        isProtected: true,
      );
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        response.data,
      );
      if (loginResponseModel.status != null &&
          loginResponseModel.status == true) {
        // return user model
        if (loginResponseModel.user != null) {
          return Right(loginResponseModel.user!);
        } else {
          throw Exception("Login Failed\nTry Again later");
        }
      } else {
        throw Exception("Login Failed\nTry Again later");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }
}
