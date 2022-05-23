import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/user.dart';

class AuthService {
  String baseUrl = 'https://shamo.linkku.space/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      var user = UserModel.fromJson(data['user']);
      var token = jsonDecode(response.body)['data']['access_token'];
      user.token = 'Bearer $token';
      
      return user;
    } else {
      throw Exception('Failed to Register!');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      var user = UserModel.fromJson(data['user']);
      var token = jsonDecode(response.body)['data']['access_token'];
      user.token = 'Bearer $token';
      
      return user;
    } else {
      throw Exception('Failed to Login!');
    }
  }
}
