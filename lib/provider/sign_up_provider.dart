// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_api_app/repository/auth_repository.dart';

import '../enums.dart';

class SignUpProvider extends ChangeNotifier {
  static final AuthRepository _authRepository = AuthRepository();

  StateEnum _state = StateEnum.unknown;
  StateEnum state = StateEnum.unknown;

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String username,
  }) async {
    try {
      _state = StateEnum.loading;
      notifyListeners();

      final Map<String, dynamic> result = await _authRepository.signUpUser(
        email: email,
        password: password,
        fullName: fullName,
        phone: phone,
        username: username,
      );

      // check result

      _state = StateEnum.success;

      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Registered Successfully!'),
        ),
      );
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
