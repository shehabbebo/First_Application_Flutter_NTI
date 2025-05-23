import 'package:ToDoApp/Features/add_task/data/models/get_tasks_response_model.dart';
import 'package:ToDoApp/Features/add_task/data/models/update_taskmodel.dart';
import 'package:ToDoApp/core/models/default_response_model.dart';
import 'package:ToDoApp/core/network/api_helper.dart';
import 'package:ToDoApp/core/network/api_response.dart';
import 'package:ToDoApp/core/network/end_point.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TasksRepo {
  // singletone
  TasksRepo._internal();
  static final TasksRepo _repo = TasksRepo._internal();
  factory TasksRepo() => _repo;

  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, String>> addTask({required TaskModel task}) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.addTask,
        isProtected: true,
        data: await task.toJsonWithoutImage(),
      );
      DefaultResponseModel responseModel = DefaultResponseModel.fromJson(
        response.data,
      );

      if (responseModel.status != null && responseModel.status == true) {
        return Right(responseModel.message ?? "Task added successfully");
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

  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      var response = await apiHelper.getRequest(
        endPoint: EndPoints.my_tasks,
        isProtected: true,
      );
      GetTasksResponseModel getTasksResponseModel =
          GetTasksResponseModel.fromJson(response.data);
      return Right(getTasksResponseModel.tasks ?? []);
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, String>> updateTask({
    required String title,
    required String description,
    required int taskId,
  }) async {
    try {
      var response = await apiHelper.putRequest(
        endPoint: "tasks/$taskId",
        isProtected: true,
        data: {"title": title, "description": description},
      );
      UpdateTaskModel responseModel = UpdateTaskModel.fromJson(response.data);

      if (responseModel.status != null && responseModel.status == true) {
        return Right(responseModel.message ?? "Task updated successfully");
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

  Future<Either<String, String>> deleteTask({required int taskId}) async {
    try {
      var response = await apiHelper.deleteRequest(
        endPoint: "tasks/$taskId",
        isProtected: true,
      );
      DefaultResponseModel responseModel = DefaultResponseModel.fromJson(
        response.data,
      );

      if (responseModel.status != null && responseModel.status == true) {
        return Right(responseModel.message ?? "Task deleted successfully");
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
