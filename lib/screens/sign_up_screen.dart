import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static final TextEditingController emailEditingController =
      TextEditingController();
  static final TextEditingController passwordEditingController =
      TextEditingController();
  static final TextEditingController phoneEditingController =
      TextEditingController();
  static final TextEditingController fullNameEditingController =
      TextEditingController();
  static final TextEditingController usernameEditingController =
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
              'Welcome \nFill the form below to create an account!',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            formWidget(
              hintText: 'Enter Full name',
              controller: fullNameEditingController,
            ),
            const SizedBox(height: 10),
            formWidget(
              hintText: 'Enter Email',
              controller: emailEditingController,
            ),
            const SizedBox(height: 10),
            formWidget(
              hintText: 'Enter Phone Number',
              controller: phoneEditingController,
            ),
            const SizedBox(height: 10),
            formWidget(
              hintText: 'Enter Username',
              controller: usernameEditingController,
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
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
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
