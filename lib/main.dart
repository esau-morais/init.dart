import 'package:flutter/material.dart';
import 'package:init_dart/task.dart';

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
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Tasks'),
          ),
          body: ListView(children: const [
            Task('Learn Dart'),
            Task('Learn Flutter'),
            Task('Learn Rust'),
            Task('Learn ML'),
            Task('Learn React Native'),
            Task('Learn Go'),
          ]),
        ));
  }
}
