import 'package:flutter/material.dart';

import '../data/task.dart';
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
      body: const Padding(
        padding: EdgeInsets.only(top: 8, bottom: 64),
        // TODO: list all tasks and persist state
        // child: FutureBuilder<List<Task>>(
        //   future: const Task().findAllTasks(),
        //   builder: (context, snapshot) {
        //     List<Task>? tasks = snapshot.data;
        //     return ListView.builder(
        //       itemCount: tasks.length,
        //       itemBuilder: (context, index) {
        //         final Task task = items[index];
        //         return task;
        //       },
        //     );
        //   },
        // ),
      ),
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
