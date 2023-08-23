enum TaskStatus { completed, pending }

class Task_ {
  String title;
  String description;
  DateTime dueDate;
  TaskStatus status;

  Task_(this.title, this.description, this.dueDate, this.status);

  @override
  String toString() {
    return '${title} ${description} ${dueDate.toString()} ${status.toString()}';
  }
}
