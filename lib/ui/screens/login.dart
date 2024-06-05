import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/ui/styles.dart';
import 'package:to_do_app/ui/widgets/background_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                            onPressed: () {},
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

class TextInput extends StatelessWidget {

  final String hintText;
  final IconData iconData;
  final TextInputType textInputType;

  const TextInput({
    super.key,
    required this.hintText,
    required this.iconData,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[700]?.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                iconData,
                size: 25,
                color: Colors.white,
              ),
            ),
            hintStyle: bodyTextStyle
          ),
          style: inputTextStyle,
          keyboardType: textInputType,
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {

  final String hintText;
  final IconData iconData;

  const PasswordInput({
    super.key,
    required this.hintText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[700]?.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  iconData,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              hintStyle: bodyTextStyle
          ),
          style: inputTextStyle,
          obscureText: true,
        ),
      ),
    );
  }
}
