import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_c12/common/remot/firebase_services.dart';
import 'package:todo_c12/tabs/tasks/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();
  Future<void> getTasksByDate() async {
    try {
      List<TaskModel> allTasks = await FirebaseServices.getTasksByDate(
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day));
      tasks = allTasks;
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> addTask(TaskModel newTask) async {
    try {
      await FirebaseServices.addTask(newTask).timeout(const Duration(seconds: 2),
          onTimeout: () async {
        await getTasksByDate();
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  changeSelectedDate(DateTime newDate) async {
    selectedDate = newDate;
    getTasksByDate();
    notifyListeners();
  }

  deleteTask(String taskId) async {
    try {
      await FirebaseServices.deleteTask(taskId).then(
        (value) {
          Fluttertoast.showToast(
              msg: 'Task deleted!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      );
      getTasksByDate();
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
