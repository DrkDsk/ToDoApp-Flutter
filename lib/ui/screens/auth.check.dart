import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/databases/notes.dart';
import 'package:to_do_app/data/providers/auth_provider.dart';
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
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    checkAuth();
  }

  Future<void> checkAuth() async {
    final token = box.get('TOKEN');

    if (token == null) {
      database.createInitialData();
    } else {
      bool isValid = await authProvider.validateToken(token);
      isAuthenticated = isValid;
      database.loadData();
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.yellow.shade300,
        body: const CircularProgressIndicator(),
      );
    }

    if (!isAuthenticated) {
      return const LoginScreen();
    }

    return const HomePage();
  }
}
