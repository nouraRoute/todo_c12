import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c12/tabs/tasks/models/task_model.dart';
import 'package:todo_c12/tabs/tasks/widgets/task_card.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  EasyInfiniteDateTimelineController? controller =
      EasyInfiniteDateTimelineController();
  DateTime selectedDate = DateTime.now();
  List<TaskModel> task = List.generate(
    10,
    (index) => TaskModel(
        name: 'name$index', details: 'details$index', date: DateTime.now()),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: EasyInfiniteDateTimeLine(
            onDateChange: (newDate) {
              selectedDate = newDate;
              setState(() {});
            },
            showTimelineHeader: false,
            firstDate: DateTime(2024),
            lastDate: DateTime(2025),
            focusDate: selectedDate,
            dayProps: EasyDayProps(
                todayStyle: DayStyle(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3),
                        borderRadius: BorderRadius.circular(12))),
                activeDayStyle: DayStyle(
                    monthStrStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                    dayStrStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                    dayNumStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12))),
                inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemBuilder: (context, index) => TaskCard(
              taskModel: task[index],
            ),
            itemCount: task.length,
          ),
        ),
      ],
    );
  }
}
