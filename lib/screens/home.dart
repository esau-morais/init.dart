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
      body: ListView(children: InheritedTask.of(context).taskList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (taskContext) => NewTask(
                        taskContext: taskContext,
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
