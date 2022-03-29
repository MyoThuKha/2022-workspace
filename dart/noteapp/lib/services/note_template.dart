import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//Template
class NoteTemplate {
  static Database? dbase;

  static final NoteTemplate instance = NoteTemplate._init();

  NoteTemplate._init();

  Future<Database> get database async {
    if (dbase != null) return dbase!;

    dbase = await startDB('Notes.db');
    return dbase!;
  }

  Future<Database> startDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE';
    const textType = 'TEXT';

    await db.execute('''
CREATE TABLE Notes (
  ${NoteFields.id} $idType, 
  ${NoteFields.title} $textType,
  ${NoteFields.context} $textType)
    ''');
  }

  Future<Note> create(Note note) async {
    Database? db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert('Notes', note.toJson());
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    Database? db = await instance.database;

    final maps = await db.query(
      'Notes',
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    Database? db = await instance.database;

    const orderBy = '${NoteFields.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query('Notes', orderBy: orderBy);
    return result.map((data) => Note.fromJson(data)).toList();
  }

  Future<int> update(Note note) async {
    Database? db = await instance.database;

    return db.update(
      'Notes',
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;

    return await db.delete(
      'Notes',
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    Database? db = await instance.database;

    db.close();
  }
}

//
class NoteFields {
  static final List<String> values = [id, title, context];
  static const String id = '_id';
  static const String title = 'title';
  static const String context = 'context';
}

class Note {
  final int? id;
  final String title;
  final String context;

  Note({this.id, required this.title, required this.context});

  Note copy({int? id, String? title, String? context}) => Note(
      id: id ?? this.id,
      title: title ?? this.title,
      context: context ?? this.context);

  static Note fromJson(Map<String, Object?> json) => Note(
      id: json[NoteFields.id] as int?,
      title: json[NoteFields.title] as String,
      context: json[NoteFields.context] as String);

  Map<String, Object?> toJson() =>
      {NoteFields.id: id, NoteFields.title: title, NoteFields.context: context};
}
