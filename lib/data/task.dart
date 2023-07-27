import 'package:sqflite/sqflite.dart';

import 'db.dart';

class Task {
  static const String sqlCommand = 'CREATE TABLE $table('
      '$id INTEGER PRIMARY KEY'
      '$name TEXT, '
      '$difficulty INTEGER, '
      '$image TEXT)';

  static const String table = 'tasks';
  static const id = 'id';
  static const String name = 'name';
  static const String difficulty = 'difficulty';
  static const String image = 'image';

  const Task({
    id,
    name,
    difficulty,
    image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'difficulty': difficulty,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, name: $name, difficulty: $difficulty, image: $image}';
  }

  Future<void> insertTask(Task task) async {
    final db = await initDb();

    await db.insert(
      table,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(Task task) async {
    final db = await initDb();

    await db.update(
      table,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Task>> findAllTasks() async {
    final db = await initDb();

    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        name: maps[i][name],
        difficulty: maps[i][difficulty],
        image: maps[i][image],
      );
    });
  }

  Future<List<Task>> findTasksByName(String? name) async {
    final db = await initDb();

    final List<Map<String, dynamic>> maps =
        await db.query(table, where: '$name = ?', whereArgs: [name]);

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        name: maps[i][name],
        difficulty: maps[i][difficulty],
        image: maps[i][image],
      );
    });
  }

  Future<void> deleteTask(int id) async {
    final db = await initDb();

    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
