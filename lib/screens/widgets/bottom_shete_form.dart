import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_c12/common/widgets/custom_elevates_button.dart';
import 'package:todo_c12/common/widgets/custom_text_field.dart';

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({super.key});

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDetailsController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                    selectedDate = date;
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                title: 'Add'),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
