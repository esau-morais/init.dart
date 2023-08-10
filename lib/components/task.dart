import 'package:flutter/material.dart';
import 'package:init_dart/components/delete_task_dialog.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  final int? id;
  final String name;
  final String src;
  final int difficulty;

  Task(
      {super.key,
      this.id,
      required this.name,
      required this.src,
      required this.difficulty});

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    return widget.src.contains('http') ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(4)),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(4)),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.src,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 192,
                            child: DefaultTextStyle(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                                child: Text(
                                  widget.name,
                                ))),
                        Difficulty(
                          difficulty: widget.difficulty,
                        )
                      ],
                    ),
                    ElevatedButton(
                        onLongPress: () =>
                            DeleteTaskDialog.showDeleteTaskConfirmationDialog(
                                context, widget.id!),
                        onPressed: () {
                          setState(() {
                            if (widget.level < widget.difficulty) {
                              setState(() {
                                widget.level++;
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You have reached the maximum mastery level!'),
                                ),
                              );
                            }
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
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                          color: Colors.white,
                          value: widget.level == widget.difficulty
                              ? 1
                              : (widget.level / widget.difficulty)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFFF2F2F2)),
                      child: Text(
                        'Level: ${widget.level}',
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ]));
  }
}
