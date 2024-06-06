import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/providers/auth_provider.dart';
import 'package:to_do_app/ui/resources/styles.dart';

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

    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[700]?.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          onChanged: (value) {
            authProvider.setPasswordText(value);
          },
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