import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  static const String routName = 'signup_screen';

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo2.png'),
          const Text(
            'pleas enter your email addres\n and enter your passwoed',
            style: TextStyle(color: Colors.grey, fontSize: 15),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
