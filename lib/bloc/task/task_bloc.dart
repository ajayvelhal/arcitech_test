import 'package:arcitech_new/bloc/task/task_event.dart';
import 'package:arcitech_new/bloc/task/task_state.dart';
import 'package:arcitech_new/models/task_creation_response.dart';
import 'package:arcitech_new/models/task_response.dart';
import 'package:arcitech_new/respository/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository = TaskRepository();

  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) async {
      if (event is CreateTask) {
        if (event.title.isEmpty) {
          emit(TaskCreationError("Title"));
        } else if (event.description.isEmpty) {
          emit(TaskCreationError("Description"));
        } else {
          emit(TaskLoading());
          Map<String, dynamic> requestBody = {
            "title": event.title,
            "description": event.description,
            "completed": event.isCompleted
          };
          TaskCreationResponse response =
              await _taskRepository.createTask(requestBody);

          if (response.status == 200) {
            emit(TaskCreatedUpdatedSuccessfully(response));
          } else {
            emit(TaskCreationError(response.message ?? ""));
          }
        }
      }

      if(event is FetchTask){
        emit(TaskLoading());
        TaskResponse response = await _taskRepository.fetchTasks();

        if(response.status == 200){
          emit(TasksFetchedSuccessfully(response));
        }
        else{
          emit(TaskCreationError(response.message ?? ""));
        }
      }
    });
  }
}
