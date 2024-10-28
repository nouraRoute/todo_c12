import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_c12/auth/models/user_data_mode.dart';
import 'package:todo_c12/common/remot/firebase_services.dart';

class LocalAuthProvider with ChangeNotifier {
  bool loading = false;
  UserDataModel? userDataModel;
  Future login(String email, String password) async {
    loading = true;
    notifyListeners();
    try {
      userDataModel = await FirebaseServices.login(email, password);
      notifyListeners();
      loading = false;
      notifyListeners();

      /// Navigator.of(context).popAndPushNamed(HomeScreen.routName);
    } catch (e) {
      loading = false;
      notifyListeners();
      String? message;
      if (e is FirebaseAuthException) {
        print('--->${e.code}');
        message = e.message;
      }
      print('--->>$message');
      Fluttertoast.showToast(
          msg: message ?? 'some thing went wrong',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future register(UserDataModel userDataModel, String password) async {
    loading = true;

    try {
      userDataModel = await FirebaseServices.register(userDataModel, password);
      notifyListeners();
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      String? message;
      if (e is FirebaseAuthException) {
        print('--->${e.code}');
        message = e.message;
      }
      print('--->>$message');
      Fluttertoast.showToast(
          msg: message ?? 'some thing went wrong',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
