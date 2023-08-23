import 'task.dart';

class TaskManager {
  List<Task_> tasks = [];

  void AddTask(Task_ task) {
    tasks.add(task);
  }

  void viewTasks() {
    tasks.forEach((task) {
      print(task);
    });
  }

  void viewCompleted() {
    tasks.forEach((task) {
      if (task.status == TaskStatus.completed) print(task);
    });
  }

  void viewPending() {
    tasks.forEach((task) {
      if (task.status == TaskStatus.pending) print(task);
    });
  }

  void editTask(
    String existingTaskTitle, {
    String? newTaskName,
    String? newTaskDescription,
    DateTime? newTaskDueDate,
    TaskStatus? newTaskStatus,
  }) {
    for (var task in tasks) {
      if (task.title == existingTaskTitle) {
        task.title = newTaskName != null ? newTaskName : task.title;
        task.description =
            newTaskDescription != null ? newTaskDescription : task.description;
        task.dueDate = newTaskDueDate != null ? newTaskDueDate : task.dueDate;
        task.status = newTaskStatus != null ? newTaskStatus : task.status;
        break;
      }
    }
  }

  void deleteTask(String taskTitle) {
    tasks.removeWhere((task) => task.title == taskTitle);
  }
}
