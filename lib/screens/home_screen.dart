import 'package:flutter/material.dart';
import 'package:todo_c12/tabs/settings/settings_tab.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: tabsList[currentTabIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
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
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
