import 'package:arcitech_new/models/task_creation_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<TaskCreationResponse> updateTask(
      Map<String, dynamic> requestBody) async {
    TaskCreationResponse creationResponse = TaskCreationResponse();
    try {
      dio.options.baseUrl = AppConstants.kBaseUrl;
      final resp = await dio.put(AppConstants.tasks, data: requestBody);
      creationResponse = TaskCreationResponse.fromJson(resp.data);
    } catch (e) {
      creationResponse.status = 500;
      creationResponse.message = e.toString();
    }
    return creationResponse;
  }
}
