import 'package:flutter/material.dart';
import 'package:note_app/services/note_template.dart';
import 'package:note_app/services/color.dart';

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

  void create(argTitle, argContext, int argColor) async {
    await NoteTemplate().create(argTitle, argContext, argColor);
  }

  Future<void> deleteData(int id) async {
    await NoteTemplate().delete(id);
    goBack();
  }

  Future<void> updateData() async {
    await NoteTemplate()
        .update(data['id'], titleEditor.text, contextEditor.text, colorValue);
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
    int colorCode = colorValue;
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    //
    titleEditor = TextEditingController(text: data['title'] ?? title);
    contextEditor = TextEditingController(text: data['context'] ?? "");

    return Scaffold(
      backgroundColor: Color(colorCode),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Edit Note',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Color(colorCode),
        elevation: 1.0,
        //App Bar Buttons
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            setState(() {
              updateData();
              goBack();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //Slider
              showModalBottomSheet(
                backgroundColor: Color(colorCode),
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                context: context,
                builder: (context) => Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 150,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  deleteData(data['id']);
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                setState(() {
                                  create(titleEditor.text, contextEditor.text,
                                      colorValue);
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {
                                setState(() {
                                  updateData();
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      //Custom Widget from color.dart
                      const ColorSlider(),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
          //Slider
        ],
      ),

      //Body part
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
