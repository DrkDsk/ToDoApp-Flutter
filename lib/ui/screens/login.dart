import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/databases/notes.dart';
import 'package:to_do_app/data/providers/auth_provider.dart';
import 'package:to_do_app/ui/resources/styles.dart';
import 'package:to_do_app/ui/screens/home.dart';
import 'package:to_do_app/ui/widgets/background_image.dart';
import 'package:to_do_app/ui/widgets/password_input.dart';
import 'package:to_do_app/ui/widgets/text_input.dart';
import 'package:to_do_app/utils/box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final box = Hive.box(authBoxName);
  AuthDatabase database = AuthDatabase();
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  Future<void> handleSubmitLogin() async {
    String token = await authProvider.login(authProvider.emailText, authProvider.passwordText);
    if(token.isNotEmpty) {
      authProvider.setAuthenticated(true);
      database.token = token;
      database.updateDatabase();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 150),
                SizedBox(
                  height: 150,
                  child: Text(
                    "ToDoApp",
                    style: headingTextStyle,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const TextInput(
                          hintText: 'Email address',
                          iconData: Icons.email,
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        const PasswordInput(
                          hintText: 'Password',
                          iconData: Icons.password,
                        ),
                        const Spacer(),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: MaterialButton(
                            onPressed: handleSubmitLogin,
                            child: Text(
                              "Login",
                              style: bodyTextStyle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
