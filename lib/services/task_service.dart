import 'package:arcitech_new/models/task_creation_response.dart';
import 'package:arcitech_new/models/task_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/all_task_response.dart';
import '../utils/constants.dart';

class TaskService {
  final Dio dio = Dio();
  late SharedPreferences sharedPreferences;

  Future<TaskCreationResponse> createTask(
      Map<String, dynamic> requestBody) async {
    TaskCreationResponse creationResponse = TaskCreationResponse();
    sharedPreferences = await SharedPreferences.getInstance();
    try {
      dio.options.baseUrl = AppConstants.kBaseUrl;
      dio.options.headers = {
        "Authorization": "Bearer ${sharedPreferences.get("auth_token")}"
      };
      final resp = await dio.post(AppConstants.tasks, data: requestBody);
      creationResponse = TaskCreationResponse.fromJson(resp.data);
    } catch (e) {
      creationResponse.status = 500;
      creationResponse.message = e.toString();
    }
    return creationResponse;
  }

  Future<TaskCreationResponse> updateTask(int id,
      Map<String, dynamic> requestBody) async {
    TaskCreationResponse creationResponse = TaskCreationResponse();
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      dio.options.baseUrl = AppConstants.kBaseUrl;
      dio.options.headers = {
        "Authorization": "Bearer ${sharedPreferences.get("auth_token")}"
      };
      final resp = await dio.put("${AppConstants.tasks}/$id/", data: requestBody);
      creationResponse = TaskCreationResponse.fromJson(resp.data);
    } catch (e) {
      creationResponse.status = 500;
      creationResponse.message = e.toString();
    }
    return creationResponse;
  }

  Future<TaskResponse> fetchTask() async {
    TaskResponse taskResponse = TaskResponse();
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      dio.options.baseUrl = AppConstants.kBaseUrl;
      dio.options.headers = {
        "Authorization": "Bearer ${sharedPreferences.get("auth_token")}"
      };
      final resp = await dio.get(
        AppConstants.tasks,
      );
      taskResponse = TaskResponse.fromJson(resp.data);
    } catch (e) {
      taskResponse.status = 500;
      taskResponse.message = e.toString();
    }
    return taskResponse;
  }

  Future<AllTaskResponse> fetchOtherUsersTask() async {
    AllTaskResponse taskResponse = AllTaskResponse();
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      dio.options.baseUrl = AppConstants.kBaseUrl;
      dio.options.headers = {
        "Authorization": "Bearer ${sharedPreferences.get("auth_token")}"
      };
      final resp = await dio.get(
        AppConstants.allTasks,
      );
      taskResponse = AllTaskResponse.fromJson(resp.data);
    } catch (e) {
      taskResponse.status = 500;
      taskResponse.message = e.toString();
    }
    return taskResponse;
  }

}
