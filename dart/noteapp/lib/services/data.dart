import 'package:note_app/services/note_template.dart';

List<NoteTemplate> textList = [
  NoteTemplate(
      title: 'Flutter first part',
      text:
          'We’ll segregate NotePage, BottomSheet and ColorSlider widgets in different classes and files to keep the code clean and manageable.'),
  NoteTemplate(
      title: 'Flutter second part',
      text:
          'Now we need a view to edit/create a note, which will also possess various useful actions in AppBar to undo, archive and more. The more action will bring up a bottom sheet with options like share, duplicate, delete permanently and a horizontally scrollable colour picker with which we’ll be able to change the background colour of that particular note.'),
  NoteTemplate(title: 'Math', text: '2*2 = 4'),
];
