import 'package:arcitech_new/models/task_response.dart';

abstract class TaskEvent {}

class CreateTask extends TaskEvent {
  final String title;
  final String description;
  final bool isCompleted;

  CreateTask(this.title, this.description, this.isCompleted);
}

class FetchTask extends TaskEvent {
  final TaskResponse taskResponse;

  FetchTask(this.taskResponse);
}


class RefreshTask extends TaskEvent {
  final TaskResponse taskResponse;

  RefreshTask(this.taskResponse);
}


class FetchOtherUsersTask extends TaskEvent {
  final TaskResponse taskResponse;

  FetchOtherUsersTask(this.taskResponse);
}

class EditTask extends TaskEvent {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;

  EditTask(this.id, this.title, this.description, this.isCompleted);
}
