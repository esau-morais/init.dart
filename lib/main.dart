import 'package:flutter/material.dart';
import 'package:init_dart/data/inherited_task.dart';

import 'screens/home.dart';

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
        home: InheritedTask(
          child: const Home(),
        ));
  }
}
