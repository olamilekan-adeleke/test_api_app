import 'package:flutter/material.dart';

// import 'login_screen.dart';
import 'screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APi Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(),
    );
  }
}
