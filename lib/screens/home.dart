import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../components/task.dart';
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
    return Stack(
      children: [
        PlatformScaffold(
          appBar: PlatformAppBar(
            title: const Text('Tasks'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 64),
            child: FutureBuilder<List<Task>>(
              future: TaskModel().findAllTasks(),
              builder: (context, snapshot) {
                List<Task>? tasks = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        Text('Loading...')
                      ]),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        Text('Loading...')
                      ]),
                    );
                  case ConnectionState.active:
                    return const Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        Text('Loading...')
                      ]),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasData && tasks != null) {
                      if (tasks.isNotEmpty) {
                        return ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final Task task = tasks[index];
                            return Dismissible(
                              key: UniqueKey(),
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                child: const Icon(Icons.delete,
                                    color: Colors.white),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                TaskModel().deleteTask(task.id as int);
                                setState(() {});
                              },
                              child: task,
                            );
                          },
                        );
                      }
                      return const Center(
                        child: Text('No tasks found',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      );
                    }
                    return const Text('Error on loading tasks');
                }
              },
            ),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext newContext) => NewTask(
                            taskContext: context,
                          ))).then((value) => setState(
                    () {},
                  ));
            },
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
