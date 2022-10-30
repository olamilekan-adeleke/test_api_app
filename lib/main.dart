// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:test_api_app/bloc/bloc_observer.dart';
// import 'package:test_api_app/provider/login_provider.dart';
// import 'package:test_api_app/repository/auth_repository.dart';

// import 'provider/sign_up_provider.dart';
// import 'screens/login_screen.dart';

// void main() {
//   BlocOverrides.runZoned(
//     () => runApp(const MyApp()),
//     blocObserver: MyBlocObserver(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: blocList(),
//       child: MaterialApp(
//         title: 'API Test',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const LoginScreen(),
//       ),
//     );
//   }
// }

// List<ChangeNotifierProvider> blocList() {
//   return [
//     ChangeNotifierProvider<LoginProvider>(
//       create: (context) => LoginProvider(AuthRepository()),
//     ),
//     ChangeNotifierProvider<SignUpProvider>(
//       create: (context) => SignUpProvider(AuthRepository()),
//     ),
//   ];
// }

// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String text = 'The default color is teal';
  Color myColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor,
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NewWidget(text: text),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            MyButton(
              title: 'Green',
              callback: () {
                setState(() {
                  _counter = 1;
                  text = 'Colors is now green';
                  myColor = Colors.green;
                });
              },
            ),
            const SizedBox(height: 20),
            MyButton(
              title: 'Teal',
              callback: () {
                setState(() {
                  _counter = 0;
                  text = 'Colors is now Teal';
                  myColor = Colors.teal;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.title,
    required this.callback,
  });

  final String title;
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        color: Colors.white,
        height: 60,
        width: 150,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
