import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_c12/tabs/tasks/models/task_model.dart';

class FirebaseServices {
  static CollectionReference<TaskModel> getTasksCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, _) => value.toJson(),
          );

  static Future<void> addTask(TaskModel task) {
    CollectionReference<TaskModel> tasksCollection = getTasksCollection();
    DocumentReference<TaskModel> docRefract = tasksCollection.doc();
    task.id = docRefract.id;
    return docRefract.set(task);
  }

  static Future<void> deleteTask(String id) {
    CollectionReference<TaskModel> tasksCollection = getTasksCollection();
    return tasksCollection.doc(id).delete();
  }

  // static Future<List<TaskModel>> getTasks() async {
  //   CollectionReference<TaskModel> tasksCollection = getTasksCollection();
  //   QuerySnapshot<TaskModel> tasksQuery = await tasksCollection.get();
  //   return tasksQuery.docs
  //       .map(
  //         (e) => e.data(),
  //       )
  //       .toList();
  // }

  static Future<List<TaskModel>> getTasksByDate(DateTime selectedDate) async {
    CollectionReference<TaskModel> tasksCollection = getTasksCollection();
    QuerySnapshot<TaskModel> tasksQuery = await tasksCollection
        .where('date', isEqualTo: Timestamp.fromDate(selectedDate))
        .get();
    return tasksQuery.docs
        .map(
          (e) => e.data(),
        )
        .toList();
  }
}
