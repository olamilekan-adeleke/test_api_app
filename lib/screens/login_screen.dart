import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums.dart';
import '../provider/login_provider.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static final TextEditingController emailEditingController =
      TextEditingController();
  static final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Text(
              'Welcome Back \nYou can login with email and password below.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            formWidget(
              hintText: 'Enter Email',
              controller: emailEditingController,
            ),
            const SizedBox(height: 10),
            formWidget(
              hintText: 'Enter Password',
              controller: passwordEditingController,
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Consumer<LoginProvider>(
                  builder: (context, LoginProvider signUpProvider, child) {
                if (signUpProvider.loginState == StateEnum.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return TextButton(
                  onPressed: () {
                    // call login function
                    //
                    context.read<LoginProvider>().login(
                          context: context,
                          email: emailEditingController.text,
                          password: passwordEditingController.text,
                        );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white)),
                );
              }),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: Text(
                'New User? Create account',
                style: TextStyle(
                  color: Colors.blue.withOpacity(0.9),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget formWidget({
    required String hintText,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
        ),
      ),
    );
  }
}
