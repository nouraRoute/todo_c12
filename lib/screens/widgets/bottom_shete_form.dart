import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_c12/common/widgets/custom_elevates_button.dart';
import 'package:todo_c12/common/widgets/custom_text_field.dart';
import 'package:todo_c12/tabs/tasks/models/task_model.dart';
import 'package:todo_c12/tabs/tasks/provider/tasks_provider.dart';

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({super.key});

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDetailsController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TasksProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(
          top: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add New Task',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CustomTextfield(
              controller: taskNameController,
              hintText: 'Task name',
              validator: (p0) {
                if (p0 == null || p0 == '') {
                  return 'task name cannot be empty';
                } else if (p0.length < 5) {
                  return 'task name cannot be less than 5';
                } else {
                  return null;
                }
              },
            ),
            CustomTextfield(
              controller: taskDetailsController,
              hintText: 'Task details',
              maxLines: 5,
              validator: (p0) {
                if (p0 == null || p0 == '') {
                  return 'task name cannot be empty';
                } else if (p0.length < 5) {
                  return 'task name cannot be less than 5';
                } else {
                  return null;
                }
              },
            ),
            Text(
              'Select Date:',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black),
            ),
            TextButton(
                onPressed: () async {
                  var date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: selectedDate,
                      lastDate: DateTime.now().add(const Duration(days: 200)));
                  if (date != null) {
                    selectedDate = DateTime(date.year, date.month, date.day);
                    setState(() {});
                  }
                },
                child: Text(
                  dateFormat.format(selectedDate),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16),
                )),
            CustomElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (formKey.currentState!.validate()) {
                          TaskModel newTask = TaskModel(
                              date: selectedDate,
                              name: taskNameController.text.trim(),
                              details: taskDetailsController.text.trim());
                          setState(() {
                            isLoading = true;
                          });
                          await provider.addTask(newTask).then(
                                (value) => Navigator.of(context).pop(),
                              );

                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                title: isLoading ? 'loading...' : 'Add'),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
