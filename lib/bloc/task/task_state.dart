import 'package:arcitech_new/models/all_task_response.dart';
import 'package:arcitech_new/models/task_creation_response.dart';
import 'package:arcitech_new/models/task_response.dart';

abstract class TaskState {}


class TaskInitial extends TaskState{}

class TaskLoading extends TaskState{}

class TasksFetchedSuccessfully extends TaskState{
  final TaskResponse response;

  TasksFetchedSuccessfully(this.response);
}

class AllTasksFetchedSuccessfully extends TaskState{
  final AllTaskResponse response;

  AllTasksFetchedSuccessfully(this.response);
}
class TaskCreatedUpdatedSuccessfully extends TaskState{
  final TaskCreationResponse response;

  TaskCreatedUpdatedSuccessfully(this.response);
}

class TaskCreationError extends TaskState{
  final String errorMessage;

  TaskCreationError(this.errorMessage);

}