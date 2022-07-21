import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as db;
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static Future <Database> database() async {
    final dbpath = await db.getDatabasesPath();
    return db.openDatabase(path.join(dbpath, 'sawondb.db'),
        onCreate: (db, version) {
          return db.execute(
              '''CREATE TABLE sawont(id TEXT PRIMARY KEY, irum TEXT, tel TEXT)''');
        }, version: 1);
  }

  static Future<List<Map<String, Object?>>> getSawons(String dbt) async {
    final db = await DatabaseHelper.database();
    return db.query(dbt);
  }

  static Future<void> insertSawon(String dbt, Map<String, Object> data) async {
    final db = await DatabaseHelper.database();
    db.insert(dbt, data);
  }

  static Future<void> updateSawon(
      String dbt, String id, Map<String, Object> data) async {
    final db = await DatabaseHelper.database();

    db.update(dbt, data, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> deleteSawon(String dbt, String id) async {
    final db = await DatabaseHelper.database();

    db.delete(dbt, where: 'id = ?', whereArgs: [id]);
  }

}