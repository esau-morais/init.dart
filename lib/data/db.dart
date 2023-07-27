import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'task.dart';

Future<Database> initDb() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      openDatabase(join(await getDatabasesPath(), '${Task.table}.db'),
          onCreate: (db, version) {
    return db.execute(Task.sqlCommand);
  }, version: 1);
  final db = await database;

  return db;
}
