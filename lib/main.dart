import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/ui/home_page.dart';
import 'package:to_do_app/utils/box.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox(boxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
