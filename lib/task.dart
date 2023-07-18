import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String name;
  const Task(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
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
                    child: Text(name,
                        style: const TextStyle(
                            fontSize: 24, overflow: TextOverflow.ellipsis))),
                ElevatedButton(
                    onPressed: () {}, child: const Icon(Icons.arrow_drop_up))
              ],
            ),
          )
        ]));
  }
}
