import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/providers/auth_provider.dart';
import 'package:to_do_app/ui/screens/auth.check.dart';
import 'package:to_do_app/utils/box.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox(boxName);
  var authBox = await Hive.openBox(authBoxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.yellow,
            fontFamily: 'Poppins'
        ),
        debugShowCheckedModeBanner: false,
        home: const AuthCheck(),
      ),
    );
  }
}
