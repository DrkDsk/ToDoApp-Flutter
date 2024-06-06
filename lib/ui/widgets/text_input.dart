import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/providers/auth_provider.dart';
import 'package:to_do_app/ui/resources/styles.dart';

class TextInput extends StatefulWidget {

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
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
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
            authProvider.setEmailText(value);
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  widget.iconData,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              hintStyle: bodyTextStyle
          ),
          style: inputTextStyle,
          keyboardType: widget.textInputType,
        ),
      ),
    );
  }
}