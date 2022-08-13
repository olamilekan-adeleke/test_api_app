import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_app/provider/login_provider.dart';

import 'provider/sign_up_provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider<SignUpProvider>(
          create: (context) => SignUpProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'API Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
