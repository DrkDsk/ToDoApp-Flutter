import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/databases/notes.dart';
import 'package:to_do_app/data/services/api_service.dart';
import 'package:to_do_app/ui/screens/home.dart';
import 'package:to_do_app/ui/screens/login.dart';
import 'package:to_do_app/utils/box.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {

  bool isLoading = true;
  bool isAuthenticated = false;
  final box = Hive.box(authBoxName);
  AuthDatabase database = AuthDatabase();
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  Future<void> checkAuth() async {

    if (box.get('TOKEN') == null) {
      print("not valid");
      database.createInitialData();
    } else {
      database.loadData();
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    if (!isAuthenticated) {
      return const LoginScreen();
    }

    return const HomePage();
  }
}
