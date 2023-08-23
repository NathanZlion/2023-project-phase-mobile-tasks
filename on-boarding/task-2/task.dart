enum TaskStatus { completed, pending }

class Task_ {
  String title;
  String description;
  DateTime dueDate;
  TaskStatus status;

  Task_({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.status,
  });

  @override
  String toString() {
    return '${title} ${description} ${dueDate.toString()} ${status.toString()}';
  }
}
