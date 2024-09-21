abstract class TaskEvent{}

class CreateTask extends TaskEvent{

  final String title;
  final String description;
  final bool isCompleted;

  CreateTask(this.title, this.description, this.isCompleted);
}