import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c12/auth/view/login_screen.dart';
import 'package:todo_c12/common/remot/firebase_services.dart';
import 'package:todo_c12/tabs/tasks/provider/tasks_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        ListTile(
          onTap: () {
            FirebaseServices.logout();
            Navigator.of(context).popAndPushNamed(LoginScreen.routName);
          },
          title: const Text('Logout'),
          trailing: const Icon(Icons.logout),
        )
      ],
    );
  }
}
