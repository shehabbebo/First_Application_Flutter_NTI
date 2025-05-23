import 'package:ToDoApp/Features/Home/data/model/respone_model.dart';
import 'package:ToDoApp/core/cashe/cache_helper.dart';
import 'package:ToDoApp/core/cashe/cache_keys.dart';
import 'package:ToDoApp/core/network/api_helper.dart';
import 'package:ToDoApp/core/network/api_response.dart';
import 'package:ToDoApp/core/network/end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AuthRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, void>> register({
    required String username,
    required String password,
    required String confirmPassword,
    required XFile? image,
  }) async {
    try {
      await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {
          'username': username,
          'password': password,
          'image':
              image == null
                  ? null
                  : await MultipartFile.fromFile(
                    image.path,
                    filename: image.name,
                  ),
        },
      );
      return Right(null);
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

  Future<Either<String, UserModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      ApiResponse response = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {'username': username, 'password': password},
      );
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        response.data,
      );
      if (loginResponseModel.status != null &&
          loginResponseModel.status == true) {
        // store tokens
        await CacheHelper.saveData(
          key: CacheKeys.accessToken,
          value: loginResponseModel.accessToken,
        );
        await CacheHelper.saveData(
          key: CacheKeys.refreshToken,
          value: loginResponseModel.refreshToken,
        );
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
