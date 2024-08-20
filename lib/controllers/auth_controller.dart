import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final dio = Dio();
  final String baseUrl = 'http://millima.flutterwithakmaljon.uz/api/';

  Future<Response?> signUp(String name, String phone, String password,
      String passwordConfirmation) async {
    try {
      final response = await dio.post(
        '${baseUrl}register',
        data: {
          'name': name,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      // token is in response.data['token']
      final token = response.data['data']["token"];
      print(response.data);
      if (token != null) {
        await _saveToken(token);
      }

      print('Sign up successful, token saved: $token');
      return response;
    } on DioException catch (e) {
      print('Error: ${e.response?.data}');
      return e.response;
    } catch (e) {
      print('Unexpected error: $e');
      return null;
    }
  }

  Future<Response?> login(
    String password,
    String phone,
  ) async {
    print(phone);
    print(password);
    return null;
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  Future<Response?> logout() async {
    final token = await _getToken();
    if (token == null) {
      print('No token found, cannot logout.');
      return null;
    }

    try {
      final response = await dio.post(
        '${baseUrl}logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('Logout successful: ${response.data}');
      await _clearToken();
      return response;
    } on DioException catch (e) {
      print('Logout error: ${e.response?.data}');
      return e.response;
    } catch (e) {
      print('Unexpected error during logout: $e');
      return null;
    }
  }

  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_token');
  }
}
