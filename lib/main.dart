import 'package:flutter/material.dart';
import 'package:flutter_hooks_package/hooks_Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter hooks prac",
      theme: ThemeData(
        primaryColor: Colors.amber.shade400,
        errorColor: Colors.red.shade400,
      ),
      darkTheme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}