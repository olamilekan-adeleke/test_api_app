// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_api_app/repository/auth_repository.dart';

import '../enums.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider(this.authRepository);

  final AuthRepository authRepository;

  StateEnum _loginState = StateEnum.unknown;
  StateEnum get loginState => _loginState;

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      _loginState = StateEnum.loading;
      notifyListeners();

      final Map<String, dynamic> result = await authRepository.login(
        email: email,
        password: password,
      );

      // check result
      log(result.toString());

      _loginState = StateEnum.success;

      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('User Login Successfully!'),
        ),
      );

      // Navigate User to home page
    } catch (e, s) {
      log(e.toString());
      log(s.toString());

      _loginState = StateEnum.error;

      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString()),
        ),
      );
    }
  }
}
