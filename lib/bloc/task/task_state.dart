import 'package:arcitech_new/models/task_creation_response.dart';

abstract class TaskState {}


class TaskInitial extends TaskState{}

class TaskLoading extends TaskState{}

class TaskCreatedUpdatedSuccessfully extends TaskState{
  final TaskCreationResponse response;

  TaskCreatedUpdatedSuccessfully(this.response);
}

class TaskCreationError extends TaskState{
  final String errorMessage;

  TaskCreationError(this.errorMessage);

}