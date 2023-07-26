import 'package:flutter/material.dart';

import '../data/inherited_task.dart';
import 'new_task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 64),
          children: InheritedTask.of(context).taskList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext newContext) => NewTask(
                        taskContext: context,
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
