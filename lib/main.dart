import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c12/auth/provider/auth_provider.dart';
import 'package:todo_c12/auth/view/login_screen.dart';
import 'package:todo_c12/auth/view/signup_screen.dart';
import 'package:todo_c12/common/app_theme.dart';
import 'package:todo_c12/firebase_options.dart';
import 'package:todo_c12/screens/home_screen.dart';
import 'package:todo_c12/tabs/tasks/provider/tasks_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.disableNetwork();
  // FirebaseFirestore.instance.settings =
  //     const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TasksProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LocalAuthProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routName: (_) => const HomeScreen(),
        LoginScreen.routName: (_) => const LoginScreen(),
        SignupScreen.routName: (_) => const SignupScreen()
      },
      initialRoute: LoginScreen.routName,
      debugShowCheckedModeBanner: false,
    );
  }
}
