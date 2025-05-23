import 'package:ToDoApp/core/models/default_response_model.dart';
import 'package:ToDoApp/core/network/api_helper.dart';
import 'package:ToDoApp/core/network/api_key.dart';
import 'package:ToDoApp/core/network/end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ChangePasswordRepo {
  //singleton
  ChangePasswordRepo._internal();
  static final ChangePasswordRepo _instance = ChangePasswordRepo._internal();
  factory ChangePasswordRepo() => _instance;
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.changePassword,
        isProtected: true,
        data: {
          ApiKeys.currentPasswordKey: currentPassword,
          ApiKeys.newPasswordKey: newPassword,
          ApiKeys.newPasswordConfirmKey: confirmPassword,
        },
      );
      DefaultResponseModel responseModel = DefaultResponseModel.fromJson(
        response.data,
      );

      if (responseModel.status != null && responseModel.status == true) {
        return Right(responseModel.message ?? "Password changed successfully");
      } else {
        throw Exception("Something went wrong");
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
