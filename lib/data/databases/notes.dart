import 'package:hive/hive.dart';
import 'package:to_do_app/utils/box.dart';

class AuthDatabase {

  String token = "";
  bool isAuthenticated = false;
  final _myBox = Hive.box(authBoxName);

  void createInitialData(){
    token = "";
  }

  void loadData() {
    token = _myBox.get("TOKEN");
  }

  void updateDatabase(){
    _myBox.put("TOKEN", token);
  }
}