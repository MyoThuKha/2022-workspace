import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteTemplate {
  Future<Database> initDatabase() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'ColorNotes.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Notes{
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE;
        title TEXT;
        context TEXT;
        color TEXT NOT NULL;
        favorite INTEGER DEFAULT 0;
      }
  ''');
  }

  Future<int> create(String title, String context, Color color) async {
    Database db = await NoteTemplate().initDatabase();
    return await db.insert(
        'Notes', {'title': title, 'context': context, 'color': '$color'});
  }

  Future<int> update(int id, String title, String context, Color color) async {
    Database db = await NoteTemplate().initDatabase();
    return await db.update(
        'Notes', {'title': title, 'context': context, 'color': '$color'},
        where: '_id = ?', whereArgs: [id]);
  }

  Future<int> delete(int argId) async {
    Database db = await NoteTemplate().initDatabase();
    return await db.delete('Notes', where: '_id = ?', whereArgs: [argId]);
  }

  Future<List<Map>> readNote(int id) async {
    Database db = await NoteTemplate().initDatabase();
    var list = await db.query('Notes', where: '_id = ?', whereArgs: [id]);
    return list
        .map((data) => {
              'id': data['_id'] as int,
              'title': data['title'] as String?,
              'context': data['context'] as String?,
              'color': data['color'] as Color,
            })
        .toList();
  }

  Future<List<Map>> readAllNote() async {
    Database db = await NoteTemplate().initDatabase();
    var list = await db.query('Notes');
    return list
        .map((data) => {
              'id': data['_id'] as int,
              'title': data['title'] as String?,
              'context': data['context'] as String?,
              'color': data['color'] as Color,
            })
        .toList();
  }

  Future<void> close() async {
    Database db = await NoteTemplate().initDatabase();
    db.close();
  }
}
