// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_api_app/repository/auth_repository.dart';

import '../enums.dart';

class SignUpProvider extends ChangeNotifier {
  static final AuthRepository _authRepository = AuthRepository();

  StateEnum _signUpState = StateEnum.unknown;
  StateEnum get signUpstate => _signUpState;

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String username,
  }) async {
    try {
      _signUpState = StateEnum.loading;
      notifyListeners();

      final Map<String, dynamic> result = await _authRepository.signUpUser(
        email: email,
        password: password,
        fullName: fullName,
        phone: phone,
        username: username,
      );

      //TODO: check result

      _signUpState = StateEnum.success;

      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('User Registered Successfully!'),
        ),
      );
    } catch (e, s) {
      log(e.toString());
      log(s.toString());

      _signUpState = StateEnum.error;

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
