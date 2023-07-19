import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String name;
  const Task(this.name, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Column(
            children: [
              Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                    ),
                    SizedBox(
                        width: 192,
                        child: Text(widget.name,
                            style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis))),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            level++;
                          });
                        },
                        child: const SizedBox(
                            width: 45,
                            height: 45,
                            child: Icon(Icons.arrow_drop_up)))
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    // TODO: match Figma design
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                          color: Colors.white, value: level / 10),
                    ),
                  ),
                  Padding(
                    // TODO: match Figma design
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Level: $level',
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFFF2F2F2)),
                    ),
                  )
                ],
              )
            ],
          ),
        ]));
  }
}
