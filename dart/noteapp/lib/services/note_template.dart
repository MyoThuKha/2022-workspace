import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteTemplate {
  String title = '';
  String context = '';
  String color = '';
  String path = '';

  NoteTemplate({required this.title, required this.context});

  Future<void> createNote() async {
    String dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_data.db');
    var db = await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
    );
    await db.execute(
        'INSERT INTO Note(title,context) VALUES(?,?)', [title, context]);
  }

  Future<void> editNote() async {}

  void _onCreate(Database db, int version) async {
    await db.execute('DROP TABLE IF EXISTS Note');
    await db.execute('''CREATE TABLE Note(
          id TEXT NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
          title TEXT,
          context TEXT)''');
  }
}
