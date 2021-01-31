import './task.dart';
import 'task.dart';

class Tasks {
  static final tasks = [
    Task(title: "taburetka"),
    Task(title: "taburetka2"),
    Task(title: "taburetka3")
  ];
  void h() {}
  List<Task> getImportantTasks() {}

  List<Task> getInMyDayTasks() {}

  static void addImportantTask(text) {
    var t = Task(title: text);
    t.isImportant = true;
    tasks.add(t);
  }

  static void deleteTask(String id) {
    tasks.removeWhere((element) => element.id == id);
  }
}
