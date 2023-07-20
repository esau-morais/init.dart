import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String name;
  final String src;
  final int difficulty;
  const Task(this.name, this.src, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  static const double defaultStarSize = 10;

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
                            child: Text(widget.name,
                                style: const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis))),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: defaultStarSize,
                                color: widget.difficulty >= 1
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: defaultStarSize,
                                color: widget.difficulty >= 2
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: defaultStarSize,
                                color: widget.difficulty >= 3
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: defaultStarSize,
                                color: widget.difficulty >= 4
                                    ? Colors.blue
                                    : Colors.blue[100]),
                            Icon(Icons.star,
                                size: defaultStarSize,
                                color: widget.difficulty >= 5
                                    ? Colors.blue
                                    : Colors.blue[100]),
                          ],
                        )
                      ],
                    ),
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
                          color: Colors.white,
                          value: widget.difficulty > 0
                              ? (level / widget.difficulty) / 10
                              : 1),
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
