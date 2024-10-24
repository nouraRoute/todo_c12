import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String name;
  String details;
  DateTime date;
  bool isDone;
  String id;
  TaskModel({
    this.id = '',
    required this.name,
    required this.details,
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            date: (json['date'] as Timestamp).toDate(),
            details: json['details'],
            name: json['name'],
            isDone: json['isDone']);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'details': details,
      'date': Timestamp.fromDate(date),
      'isDone': isDone,
      'id': id
    };
  }
}
