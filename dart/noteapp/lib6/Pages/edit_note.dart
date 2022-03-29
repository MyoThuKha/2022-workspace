import 'package:flutter/material.dart';
import 'package:note_app/services/note_template.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  Map data = {};
  String title = 'New Note';

  late TextEditingController titleEditor;
  late TextEditingController contextEditor;

  deleteData(int id) async {
    await NoteTemplate.instance.delete(id);
    goBack();
  }

  void goBack() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    //
    titleEditor = TextEditingController(text: data['title'] ?? title);
    contextEditor = TextEditingController(text: data['context'] ?? "");

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            setState(() {
              goBack();
            });
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                deleteData(data['id']);
              });
            },
            icon: const Icon(Icons.delete),
            color: Colors.orange,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 100.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleEditor,
              maxLines: 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
              autofocus: false,
              cursorColor: Colors.black,
              style: const TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: contextEditor,
              autofocus: false,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Context'),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              cursorColor: Colors.black,
              cursorHeight: 25,
              autocorrect: false,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
