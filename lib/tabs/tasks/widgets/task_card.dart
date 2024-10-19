import 'package:flutter/material.dart';
import 'package:todo_c12/tabs/tasks/models/task_model.dart';

class TaskCard extends StatelessWidget {
  TaskCard({required this.taskModel, super.key});
  TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        color: Colors.white,
        child: SizedBox(
          height: sHeight * .12,
          child: Center(
            child: ListTile(
              title: Text(
                taskModel.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(taskModel.details),
              leading: Container(
                width: 4,
                height: sHeight * .09,
                color: Theme.of(context).primaryColor,
              ),
              trailing: Container(
                width: sWidth * .15,
                height: sHeight * .034,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }
}
