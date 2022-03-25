import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NoteTemplate {
  String title = '';
  String context = '';
  String color = '';
  String path = '';
  int id = 0;

  NoteTemplate({required this.title, required this.context});

  void _onCreate(Database db, int version) async {
    //await db.execute('DROP TABLE IF EXISTS Note');
    //id++;
    await db.execute('''CREATE TABLE Note(
          id TEXT NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
          title TEXT,
          context TEXT)''');
  }

  Future<Database> createDB() async {
    String dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_data.db');
    return await openDatabase(path, version: 3, onCreate: _onCreate);
  }

  Future<void> createNote() async {
    Database db = createDB() as Database;
    int dataID = await db.insert('Note', {'title': title, 'context': context});
  }

  Future<void> editNote() async {
    Database db = createDB() as Database;
    int updatecount = await db.update(
        'Note', {'title': title, 'context': context},
        where: 'id = ?', whereArgs: ['id']);
  }

  Future<void> deleteNote() async {
    Database db = createDB() as Database;
    int count = await db.delete('Note', where: 'id=?', whereArgs: ['id']);

    await db.close();
  }

  Future<void> getData() async {
    Database db = createDB() as Database;
    var list = await db.query('Note', columns: ['title', 'context']);
  }
}
