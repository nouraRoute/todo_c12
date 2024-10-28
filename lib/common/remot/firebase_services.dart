import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_c12/auth/models/user_data_mode.dart';
import 'package:todo_c12/tabs/tasks/models/task_model.dart';

class FirebaseServices {
  static CollectionReference<TaskModel> getTasksCollection() =>
      getUserCollection()
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, _) => value.toJson(),
          );
  static CollectionReference<UserDataModel> getUserCollection() =>
      FirebaseFirestore.instance
          .collection('users')
          .withConverter<UserDataModel>(
            fromFirestore: (snapshot, _) =>
                UserDataModel.fromJson(snapshot.data() ?? {}),
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

  static Future<UserDataModel?> login(String email, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print('===>${FirebaseAuth.instance.currentUser!.uid}');
    print('===>${credential.user?.uid}');
    return getUser();
  }

  static Future<UserDataModel> register(
      UserDataModel userDataModel, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userDataModel.email!, password: password);
    print('===>${FirebaseAuth.instance.currentUser!.uid}');
    print('===>${credential.user?.uid}');
    userDataModel.id = credential.user?.uid;
    await createUser(userDataModel);
    return userDataModel;
  }

  static Future<UserDataModel?> getUser() async {
    DocumentSnapshot<UserDataModel> docRefract = await getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return docRefract.data();
  }

  static Future<void> createUser(UserDataModel userDataModel) async {
    return await getUserCollection().doc(userDataModel.id).set(userDataModel);
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
