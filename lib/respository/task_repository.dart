import 'package:arcitech_new/services/task_service.dart';

import '../models/task_creation_response.dart';
import '../models/task_response.dart';

class TaskRepository {
  final TaskService _service = TaskService();

  Future<TaskCreationResponse> createTask(Map<String, dynamic> requestBody) =>
      _service.createTask(requestBody);

  Future<TaskCreationResponse> updateTask(Map<String, dynamic> requestBody) =>
      _service.updateTask(requestBody);

  Future<TaskResponse> fetchTasks()=> _service.fetchTask();
}
