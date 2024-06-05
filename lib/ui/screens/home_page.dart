import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/box.dart';
import 'package:to_do_app/ui/dialog_box.dart';
import 'package:to_do_app/ui/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box(boxName);
  final TextEditingController controller = TextEditingController();
  ToDoDatabase database = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index][1];
    });
    database.updateDatabase();
  }

  void saveNewTask() {
    final String body = controller.text;
    setState(() {
      database.toDoList.add([body, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    database.updateDatabase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
          );
        },
    );
  }

  void deleteTask(index) {
    setState(() {
      database.toDoList.removeAt(index);
    });
    database.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        title: const Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final item = database.toDoList[index];
          return ToDoTile(
            taskName: item[0],
            taskCompleted: item[1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
        itemCount: database.toDoList.length
      ),
    );
  }
}
