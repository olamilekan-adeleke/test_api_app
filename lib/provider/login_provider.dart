// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_api_app/repository/auth_repository.dart';

import '../enums.dart';

class LoginProvider extends ChangeNotifier {
  static final AuthRepository _authRepository = AuthRepository();

  StateEnum _state = StateEnum.unknown;
  StateEnum get state => _state;

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      _state = StateEnum.loading;
      notifyListeners();

      final Map<String, dynamic> result = await _authRepository.login(
        email: email,
        password: password,
      );

      // check result

      _state = StateEnum.success;

      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Login Successfully!'),
        ),
      );

      // Navigate User to home page
    } catch (e, s) {
      log(e.toString());
      log(s.toString());

      _state = StateEnum.error;

      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
