import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_c12/tabs/tasks/models/task_model.dart';
import 'package:todo_c12/tabs/tasks/provider/tasks_provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({required this.taskModel, super.key});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        color: Colors.white,
        child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: .4,
            children: [
              SlidableAction(
                onPressed: (context) async {
                  Provider.of<TasksProvider>(context, listen: false)
                      .deleteTask(taskModel.id);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12)),
              ),
            ],
          ),
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
          ),
        ));
  }
}
