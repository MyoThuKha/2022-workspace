import 'package:flutter/material.dart';
import 'package:note_app/services/note_template.dart';
import 'package:advanced_icon/advanced_icon.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  String title = 'New Note';
  String text = '';
  IconData saveIcon = Icons.add;
  Color? iconColor = Colors.blue;

  TextEditingController titleControl = TextEditingController();
  TextEditingController textControl = TextEditingController();

  @override
  void dispose() {
    titleControl.dispose();
    textControl.dispose();
    super.dispose();
  }

  void getDB(title, context) async {
    NoteTemplate instance = NoteTemplate(title: title, context: context);
    await instance.createNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: TextField(
          controller: titleControl,
          maxLines: 1,
          decoration: null,
          autofocus: true,
          cursorColor: Colors.black,
          cursorHeight: 25,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                title = titleControl.text == "" ? title : titleControl.text;
                text = textControl.text;
                saveIcon = Icons.check;
                iconColor = Colors.green;
              });
              //setState
              getDB(title, context);
              //dispose();
            },
            icon: AdvancedIcon(
              icon: saveIcon,
              color: iconColor,
              effect: AdvancedIconEffect.bubbleFade,
            ),
            color: Colors.black,
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 100.0),
        child: TextField(
          controller: textControl,
          decoration: null,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          cursorColor: Colors.black,
          cursorHeight: 25,
          autocorrect: false,
        ),
      ),
    );
  }
}
