import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficulty;
  const Difficulty({required this.difficulty, super.key});

  static const double defaultStarSize = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: defaultStarSize,
            color: difficulty >= 1 ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: defaultStarSize,
            color: difficulty >= 2 ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: defaultStarSize,
            color: difficulty >= 3 ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: defaultStarSize,
            color: difficulty >= 4 ? Colors.blue : Colors.blue[100]),
        Icon(Icons.star,
            size: defaultStarSize,
            color: difficulty >= 5 ? Colors.blue : Colors.blue[100]),
      ],
    );
  }
}
