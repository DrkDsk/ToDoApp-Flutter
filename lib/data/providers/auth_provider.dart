import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/data/services/api_service.dart';

class AuthProvider extends ChangeNotifier {

  ApiService apiService = ApiService();
  bool isAuthenticated = false;
  String emailText = "";
  String passwordText = "";

  setAuthenticated(bool value) {
    isAuthenticated = value;
    notifyListeners();
  }

  setEmailText(String email) {
    emailText = email;
    notifyListeners();
  }

  setPasswordText(String password) {
    passwordText = password;
    notifyListeners();
  }

  Future<String> login(String email, String password) async {
    String token = await apiService.login(email, password);
    return token;
  }
}