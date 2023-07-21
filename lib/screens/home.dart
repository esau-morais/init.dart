import 'package:flutter/material.dart';

import '../components/task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(microseconds: 800),
        child: ListView(children: const [
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
          Task('Learn React Native', 'https://reactnative.dev/img/logo-og.png',
              2),
          Task('Learn Go',
              'https://go.dev/blog/go-brand/Go-Logo/PNG/Go-Logo_Blue.png', 4),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
