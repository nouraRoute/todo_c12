import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c12/common/widgets/custum_scaffold_bg.dart';
import 'package:todo_c12/screens/widgets/bottom_shete_form.dart';
import 'package:todo_c12/tabs/settings/settings_tab.dart';
import 'package:todo_c12/tabs/tasks/provider/tasks_provider.dart';
import 'package:todo_c12/tabs/tasks/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'Home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabsList = [const TasksTab(), const SettingsTab()];
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldBG(
      appBar: AppBar(
        title: const Text('To Do app'),
      ),
      body: tabsList[currentTabIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            elevation: 0,
            onTap: (value) {
              currentTabIndex = value;
              setState(() {});
            },
            currentIndex: currentTabIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list, size: 30), label: 'tasks list'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined, size: 30),
                  label: 'settings'),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Provider.of<TasksProvider>(context)
                .selectedDate
                .isBefore((DateTime.now().subtract(const Duration(days: 1))))
            ? Colors.grey
            : null,
        onPressed: Provider.of<TasksProvider>(context)
                .selectedDate
                .isBefore((DateTime.now().subtract(const Duration(days: 1))))
            ? null
            : () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const BottomSheetForm();
                  },
                );
              },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
