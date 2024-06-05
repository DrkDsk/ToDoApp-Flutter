import 'package:flutter/material.dart';
import 'package:to_do_app/ui/dialog.button.dart';

class DialogBox extends StatelessWidget {

  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task"
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(
                  text: "Save",
                  onPressed: onSave
                ),
                const SizedBox(width: 8),
                DialogButton(
                    text: "Cancel",
                    onPressed: onCancel
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
