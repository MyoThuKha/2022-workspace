import 'package:flutter/material.dart';
import 'package:note_app/services/note_template.dart';
import 'package:note_app/services/color.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  String title = '';
  String text = '';
  bool isCreated = false;
  int currId = 0;

  TextEditingController titleControl = TextEditingController();
  TextEditingController textControl = TextEditingController();

  @override
  void dispose() {
    titleControl.dispose();
    textControl.dispose();
    super.dispose();
  }

  void create(argTitle, argContext, int argColor) async {
    currId = await NoteTemplate().create(argTitle, argContext, argColor);
    setState(() {
      this.currId = currId;
    });
  }

  void goBack() {
    Navigator.pushReplacementNamed(context, '/');
  }

  Future<void> deleteData(int id) async {
    await NoteTemplate().delete(id);
    goBack();
  }

  Future<void> updateData(
      int argId, String argTitle, String argContext, int argColor) async {
    await NoteTemplate().update(argId, argTitle, argContext, argColor);
  }

  @override
  Widget build(BuildContext context) {
    int colorCode = colorValue;
    return Scaffold(
      backgroundColor: Color(colorCode),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'New Note',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Color(colorCode),
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              goBack();
            });
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
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
                                  goBack();
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
                                  title = titleControl.text;
                                  text = textControl.text;
                                });
                                create(title, text, colorValue);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {
                                setState(() {
                                  title = titleControl.text;
                                  text = textControl.text;
                                });
                                if (isCreated) {
                                  updateData(currId, title, text, colorValue);
                                } else {
                                  create(title, text, colorValue);
                                }
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      //Custom Widget from color.dart
                      const ColorSlider(),
                    ],
                    //actions bar
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
          //Slider
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 100.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleControl,
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
              controller: textControl,
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
