import 'package:flutter/widgets.dart';

import '../components/task.dart';

class InheritedTask extends InheritedWidget {
  InheritedTask({super.key, required super.child});

  final List<Task> taskList = [
    const Task('Learn Dart',
        'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png', 4),
    const Task(
        'Learn Flutter',
        'https://blog.logrocket.com/wp-content/uploads/2022/05/adaptive-icons-flutter-launcher-icons.png',
        3),
    const Task(
        'Learn Rust',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Rust_programming_language_black_logo.svg/1024px-Rust_programming_language_black_logo.svg.png',
        4),
    const Task(
        'Learn ML',
        'https://upload.wikimedia.org/wikipedia/commons/d/d5/Hey_Machine_Learning_Logo.png',
        3),
    const Task(
        'Learn React Native', 'https://reactnative.dev/img/logo-og.png', 2),
    const Task('Learn Go',
        'https://go.dev/blog/go-brand/Go-Logo/PNG/Go-Logo_Blue.png', 4),
  ];

  void newTask(String name, String image, int difficulty) {
    taskList.add(Task(name, image, difficulty));
  }

  static InheritedTask of(BuildContext context) {
    final InheritedTask? result =
        context.dependOnInheritedWidgetOfExactType<InheritedTask>();
    assert(result != null, 'No InheritedTask found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedTask oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
