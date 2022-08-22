import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_api_app/bloc/bloc_observer.dart';
import 'package:test_api_app/provider/login_provider.dart';
import 'package:test_api_app/repository/auth_repository.dart';

import 'provider/sign_up_provider.dart';
import 'screens/login_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: blocList(),
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

List<ChangeNotifierProvider> blocList() {
  return [
    ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(AuthRepository()),
    ),
    ChangeNotifierProvider<SignUpProvider>(
      create: (context) => SignUpProvider(AuthRepository()),
    ),
  ];
}
