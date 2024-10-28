import 'package:flutter/material.dart';
import 'package:todo_c12/auth/view/login_screen.dart';
import 'package:todo_c12/auth/widgets/custom_auth_textfield.dart';
import 'package:todo_c12/common/widgets/custom_elevates_button.dart';

class SignupScreen extends StatefulWidget {
  static const String routName = 'signup_screen';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
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
                      validator: (p0) {
                        if (isValidEmail(p0 ?? '')) {
                          return null;
                        } else {
                          return 'invalid email';
                        }
                      },
                    ),
                    CustomAuthTextfield(
                      hintText: 'Enter your name',
                      keyboardTyp: TextInputType.text,
                      prefixIcon: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 18,
                          )),
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'the name cannot be empty';
                        } else if (p0.length < 5) {
                          return 'the name should be at leas 7 characters';
                        }
                        return null;
                      },
                    ),
                    CustomAuthTextfield(
                      hintText: 'Enter your password',
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
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'password cannot be empty';
                        } else if (p0.length < 7) {
                          return 'password should be at leas 7 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 220,
                      height: 50,
                      child: CustomElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        title: 'Register ',
                        backgroundColor: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have an account?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routName);
                            },
                            child: const Text('Login')),
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
                              backgroundColor:
                                  const Color.fromRGBO(249, 250, 252, 1)),
                        ),
                        IconButton.filled(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.black,
                          ),
                          style: IconButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(249, 250, 252, 1)),
                        ),
                        IconButton.filled(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            color: Colors.black,
                          ),
                          style: IconButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(249, 250, 252, 1)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String inputText) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(inputText);
  }
}
