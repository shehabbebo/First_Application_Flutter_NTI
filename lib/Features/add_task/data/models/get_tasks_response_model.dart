import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class GetTasksResponseModel {
  bool? status;
  List<TaskModel>? tasks;

  GetTasksResponseModel({this.status, this.tasks});

  GetTasksResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['tasks'] != null) {
      tasks = <TaskModel>[];
      json['tasks'].forEach((v) {
        tasks!.add(TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (tasks != null) {
      data['tasks'] = tasks!.map((v) => v.toJsonWithoutImage()).toList();
    }
    return data;
  }
}

class TaskModel {
  String? createdAt;
  String? description;
  int? id;
  String? imagePath;
  String? title;
  XFile? image;
  String? group;
  String? date;

  TaskModel({
    this.createdAt,
    this.description,
    this.id,
    this.imagePath,
    this.title,
    this.image,
    this.group,
    this.date,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    title = json['title'];
    group = json['group'];
    date = json['date'];
  }

  Map<String, dynamic> toJsonWithoutImage() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['title'] = title;
    data['group'] = group;
    data['date'] = date;
    return data;
  }

  Future<FormData> toMultipartFormData() async {
    final formData = FormData.fromMap({
      'description': description,
      'title': title,
      'group': group,
      'date': date,
      if (image != null)
        'image': await MultipartFile.fromFile(
          image!.path,
          filename: image!.name,
        ),
    });
    return formData;
  }
}
