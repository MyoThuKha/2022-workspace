import 'package:flutter/material.dart';
import 'package:note_app/services/note_template.dart';
import 'package:note_app/services/color.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  String titleLog = '';
  String textLog = '';
  bool isCreated = false;
  bool clickSliderButton = false;
  int currId = 0;
  int colorCode = 0;
  bool isFav = false;

  Icon favoriteIcon = const Icon(Icons.star_outline_rounded);

  late TextEditingController titleControl;
  late TextEditingController textControl;

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
      int id, String title, String text, int colorValue, bool argFav) async {
    int value = argFav ? 1 : 0;
    await NoteTemplate().update(id, title, text, colorValue, value);
  }

  @override
  Widget build(BuildContext context) {
    colorCode = (colorCode == 0) ? 0xffffffff : colorValue;

    titleControl = TextEditingController(
        text: (isCreated || clickSliderButton) ? titleControl.text : '');
    textControl = TextEditingController(
        text: (isCreated || clickSliderButton) ? textControl.text : '');

    Icon favoriteIcon = isFav
        ? const Icon(
            Icons.star_outlined,
            color: Colors.yellow,
          )
        : const Icon(Icons.star_outline_rounded);

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
                backgroundColor: Colors.white,
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
                                  /*
                                  title = titleControl.text;
                                  text = textControl.text;
                                  */
                                });
                                create(titleControl, textControl, colorCode);
                                goBack();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: favoriteIcon,
                              onPressed: () {
                                setState(() {
                                  clickSliderButton = true;
                                  if (isFav == false) {
                                    isFav = true;
                                  } else {
                                    isFav = false;
                                  }
                                  updateData(currId, titleLog, textLog,
                                      colorCode, isFav);
                                  Navigator.pop(context);
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
                                  titleLog = titleControl.text;
                                  textLog = textControl.text;
                                });
                                if (isCreated) {
                                  updateData(currId, titleLog, textLog,
                                      colorCode, isFav);
                                } else {
                                  create(titleLog, textLog, colorCode);
                                }
                                setState(() {
                                  isCreated = true;
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      //Custom Widget from color.dart
                      SizedBox(
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(colorList.length, (index) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          colorValue = colorList[index].value;
                                          clickSliderButton = true;
                                        });
                                        updateData(currId, titleLog, textLog,
                                            colorCode, isFav);
                                        setState(() {});
                                      },
                                      //See at color.dart
                                      child: colorSlider(index),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
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
