import 'package:flutter/material.dart';
import 'package:todo_c12/auth/widgets/custom_auth_textfield.dart';
import 'package:todo_c12/common/widgets/custom_elevates_button.dart';

class LoginScreen extends StatelessWidget {
  static const String routName = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          Image.asset('assets/images/logo2.png'),
          const Text(
            'pleas enter your email address \n and enter your password',
            style: TextStyle(color: Colors.grey, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomAuthTextfield(
            hintText: 'Enter your email',
            keyboardTyp: TextInputType.emailAddress,
            prefixIcon: Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                  size: 18,
                )),
          ),
          CustomAuthTextfield(
            hintText: 'Enter your email',
            password: true,
            prefixIcon: Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.lock_open_outlined,
                  color: Colors.black,
                  size: 18,
                )),
          ),
          const Spacer(
            flex: 2,
          ),
          TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
          SizedBox(
            width: 220,
            height: 50,
            child: CustomElevatedButton(
              onPressed: () {},
              title: 'Login ',
              backgroundColor: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Register')),
            ],
          ),
          const Row(
            children: [
              Expanded(
                  child: Divider(
                endIndent: 10,
                indent: 10,
              )),
              Text('OR'),
              Expanded(
                  child: const Divider(
                endIndent: 10,
                indent: 10,
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.black,
                ),
                style: IconButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 250, 252, 1)),
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.black,
                ),
                style: IconButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 250, 252, 1)),
              ),
              IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.black,
                ),
                style: IconButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(249, 250, 252, 1)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
