import 'package:ToDoApp/core/models/default_response_model.dart';
import 'package:ToDoApp/core/network/api_helper.dart';
import 'package:ToDoApp/core/network/api_key.dart';
import 'package:ToDoApp/core/network/end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UpdateUserProfileRepo {
  //singleton instance
  UpdateUserProfileRepo._internal();
  static final UpdateUserProfileRepo _instance =
      UpdateUserProfileRepo._internal();
  factory UpdateUserProfileRepo() => _instance;
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> updateUserProfile({
    required String userName,
    required XFile? image,
  }) async {
    try {
      Response response = await apiHelper.putRequest(
        data: {
          ApiKeys.userNameApiKey: userName,
          ApiKeys.imageApiKey:
              image == null
                  ? null
                  : await MultipartFile.fromFile(
                    image.path,
                    filename: image.name,
                  ),
        },
        endPoint: EndPoints.updateUserProfile,
        isProtected: true,
      );

      DefaultResponseModel responseModel = DefaultResponseModel.fromJson(
        response.data,
      );
      if (responseModel.status != null && responseModel.status == true) {
        if (responseModel.message != null) {
          return Right(responseModel.message!);
        } else {
          throw Exception("update user profile Failed\nTry Again later");
        }
      } else {
        throw Exception("update user profile Failed\nTry Again later");
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
