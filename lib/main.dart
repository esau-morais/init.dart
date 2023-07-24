import 'package:flutter/material.dart';
// import 'package:init_dart/screens/home.dart';
import 'package:init_dart/screens/new_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const NewTask());
  }
}
