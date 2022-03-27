const String tableNotes = 'Note';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, title, context
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String context = 'context';
}

class Note {
  final int? id;
  final String title;
  final String context;

  const Note({
    this.id,
    required this.title,
    required this.context,
  });

  Note copy({
    int? id,
    String? title,
    String? context,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        context: context ?? this.context,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        title: json[NoteFields.title] as String,
        context: json[NoteFields.context] as String,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.context: context,
      };
}
