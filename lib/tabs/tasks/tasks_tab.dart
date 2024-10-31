import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c12/tabs/tasks/models/task_model.dart';
import 'package:todo_c12/tabs/tasks/provider/tasks_provider.dart';
import 'package:todo_c12/tabs/tasks/widgets/task_card.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  EasyInfiniteDateTimelineController? controller =
      EasyInfiniteDateTimelineController();
  DateTime focusDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<TasksProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: EasyInfiniteDateTimeLine(
            onDateChange: (newDate) {
              focusDate = newDate;
              setState(() {});
            },
            showTimelineHeader: false,
            firstDate: DateTime(2024),
            lastDate: DateTime(2025),
            focusDate: focusDate,
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
        StreamBuilder<List<TaskModel>?>(
          stream: Provider.of<TasksProvider>(context, listen: false)
              .getTasksByDate(focusDate),
          builder: (context, snapshot) {
            print('XXX->${snapshot.connectionState}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              var data = snapshot.data;
              print('XXX->${snapshot.data}');
              if (data == null || data.isEmpty) {
                return const Expanded(
                    child: Center(
                  child: Text('No tasks today'),
                ));
              }
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) => TaskCard(
                    taskModel: (data)[index],
                  ),
                  itemCount: (data).length,
                ),
              );
            }
          },
        )
      ],
    );
  }
}
