import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class NoteTemplate {
  //NoteTemplate instance = NoteTemplate._init();

  String title = '';
  String context = '';
  String color = '';
  String path = '';
  Database? _database;
  NoteTemplate instance = NoteTemplate();

  //NoteTemplate._init();
  NoteTemplate();

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE Note{
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
        title TEXT,
        context TEXT,
      }
''');
  }

  Future<Database?> dataBase() async {
    if (_database != null) return _database;
    String path = await getPath('my_data.db');
    await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<String> getPath(String fileName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String path = join(appDocPath, fileName);
    return path;
  }

  Future<int?> createNote(String argTitle, String argText) async {
    var db = await instance.dataBase();
    int? recordID =
        await db?.insert('Note', {'title': argTitle, 'context': argText});
    return recordID;
  }

  Future getAllData() async {
    var db = await instance.dataBase();
    var result = db?.query('Note');
    return (result);
  }

  Future<void> closeDB() async {
    final db = await instance.dataBase();
    db?.close();
  }
}

//
class Note {
  final int? id;
  final title;
  final String context;

  Note({this.id, required this.title, required this.context});

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json['_id'] as int?,
        title: json['title'] as String,
        context: json['context'] as String,
      );
}
