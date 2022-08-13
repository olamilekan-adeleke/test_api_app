import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthRepository {
  static const String _baseUrl = 'localhost:5000';

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final Map<String, String> header = <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final Map<String, dynamic> body = <String, String>{
        'email': email,
        'password': password,
      };

      final http.Response response = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: header,
        body: body,
      );

      final Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode != 200) {
        throw data['msg'];
      }

      return data;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw e.toString();
    }
  }

  Future<Map<String, dynamic>> signUpUser({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String username,
  }) async {
    final Map<String, String> header = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final Map<String, dynamic> body = <String, String>{
      'email': email,
      'password': password,
      'fullname': fullName,
      'phone': phone,
      'username': username,
    };

    final http.Response response = await http.post(
      Uri.parse('$_baseUrl/auth/signUp'),
      headers: header,
      body: body,
    );

    final Map<String, dynamic> data = json.decode(response.body);

    if (response.statusCode != 200) {
      throw data['msg'];
    }

    return data;
  }
}
