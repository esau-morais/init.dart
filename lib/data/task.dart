import 'package:sqflite/sqflite.dart';
import '../components/task.dart';
import 'db.dart';

class TaskModel {
  static const String sqlCommand = 'CREATE TABLE $table('
      '$id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '
      '$name TEXT, '
      '$difficulty INTEGER, '
      '$image TEXT)';

  static const String table = 'tasks';
  static const String id = 'id';
  static const String name = 'name';
  static const String difficulty = 'difficulty';
  static const String image = 'image';

  Map<String, dynamic> toMap(Task task) {
    return {
      id: task.id,
      name: task.name,
      difficulty: task.difficulty,
      image: task.src,
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
      toMap(task),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(Task task) async {
    final db = await initDb();

    await db.update(
      table,
      toMap(task),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<List<Task>> findAllTasks() async {
    final db = await initDb();

    final List<Map<String, dynamic>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      final Task task = Task(
        id: maps[i][id],
        name: maps[i][name],
        difficulty: maps[i][difficulty],
        src: maps[i][image],
      );
      return task;
    });
  }

  Future<List<Task>> findTasksByName(String? name) async {
    final db = await initDb();

    final List<Map<String, dynamic>> maps =
        await db.query(table, where: '$name = ?', whereArgs: [name]);

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i][id],
        name: maps[i][name],
        difficulty: maps[i][difficulty],
        src: maps[i][image],
      );
    });
  }

  Future<void> deleteTask(int? id) async {
    final db = await initDb();

    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
