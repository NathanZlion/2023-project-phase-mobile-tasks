import 'dart:io';
import 'task.dart';
import 'task_manager.dart';

void main() {
  TaskManager taskManager = TaskManager();

  while (true) {
    print('Task Manager');
    print('1. Add task');
    print('2. View all tasks');
    print('3. View completed tasks');
    print('4. View pending tasks');
    print('5. Edit task');
    print('6. Delete task');
    print('0. Exit');
    stdout.write('Enter your choice: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addTask(taskManager);
        break;
      case '2':
        viewAllTasks(taskManager);
        break;
      case '3':
        viewCompletedTasks(taskManager);
        break;
      case '4':
        viewPendingTasks(taskManager);
        break;
      case '5':
        editTask(taskManager);
        break;
      case '6':
        deleteTask(taskManager);
        break;
      case '0':
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }

    print('\n');
  }
}

void addTask(TaskManager taskManager) {
  stdout.write('Enter task title:  ');
  var taskTitle = stdin.readLineSync();
  stdout.write("Enter task description:  ");
  var taskDescription = stdin.readLineSync();
  stdout.write("Enter task due date: format 2012-02-27:  ");
  var dueDate = stdin.readLineSync();

  Task_ task = Task_(
    title: taskTitle!,
    status: TaskStatus.pending,
    description: taskDescription!,
    dueDate: DateTime.parse(dueDate!),
  );

  taskManager.AddTask(task);
  print('Task added successfully.');
}

void viewAllTasks(TaskManager taskManager) {
  print('All Tasks:');
  taskManager.viewTasks();
}

void viewCompletedTasks(TaskManager taskManager) {
  print('Completed Tasks:');
  taskManager.viewCompleted();
}

void viewPendingTasks(TaskManager taskManager) {
  print('Pending Tasks:');
  taskManager.viewPending();
}

void editTask(TaskManager taskManager) {
  stdout.write('Enter the existing task title:  ');
  var existingTaskTitle = stdin.readLineSync();
  stdout.write('Enter new task title (leave blank if not changed):  ');
  var taskTitle = stdin.readLineSync();
  stdout.write("Enter new task description (leave blank if not changed):  ");
  var taskDescription = stdin.readLineSync();
  stdout.write(
      "Enter new task due date: format 2012-02-27 (leave blank if not changed):  ");
  var dueDate = DateTime.parse(stdin.readLineSync()!);
  stdout.write("Enter if task is completed | y / n:  ");
  var statusInput = stdin.readLineSync();
  var taskStatus =
      statusInput == "y" ? TaskStatus.completed : TaskStatus.pending;

  taskManager.editTask(existingTaskTitle!,
      newTaskDescription: taskDescription,
      newTaskDueDate: dueDate,
      newTaskStatus: taskStatus);
  print('Task edited successfully.');
}

void deleteTask(TaskManager taskManager) {
  stdout.write('Enter task name to delete:  ');
  var taskName = stdin.readLineSync();
  taskManager.deleteTask(taskName!);
  print('Task deleted successfully.');
}
