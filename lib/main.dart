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
            Task(
                'Learn Dart',
                'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
                4),
            Task(
                'Learn Flutter',
                'https://blog.logrocket.com/wp-content/uploads/2022/05/adaptive-icons-flutter-launcher-icons.png',
                3),
            Task(
                'Learn Rust',
                'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Rust_programming_language_black_logo.svg/1024px-Rust_programming_language_black_logo.svg.png',
                4),
            Task(
                'Learn ML',
                'https://upload.wikimedia.org/wikipedia/commons/d/d5/Hey_Machine_Learning_Logo.png',
                3),
            Task('Learn React Native',
                'https://reactnative.dev/img/logo-og.png', 2),
            Task('Learn Go',
                'https://go.dev/blog/go-brand/Go-Logo/PNG/Go-Logo_Blue.png', 4),
          ]),
        ));
  }
}
