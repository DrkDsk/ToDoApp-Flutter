import 'package:hive/hive.dart';
import 'package:to_do_app/utils/box.dart';

class ToDoDatabase {

  List toDoList = [];
  final _myBox = Hive.box(boxName);

  void createInitialData(){
    toDoList = [];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }

}