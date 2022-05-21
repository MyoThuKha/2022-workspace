import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/services/base.dart';
import 'package:note_app/services/note_template.dart';
import 'package:note_app/services/color.dart';
import 'package:note_app/services/time.dart';

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
  String date = '';
  String time = '';

  Icon favoriteIcon = const Icon(Icons.star_outline_rounded);

  late TextEditingController titleControl;
  late TextEditingController textControl;

  @override
  void dispose() {
    titleControl.dispose();
    textControl.dispose();
    super.dispose();
  }

  Future<void> create(argTitle, argContext, int argColor) async {
    await getDateTime();
    currId =
        await NoteTemplate().create(argTitle, argContext, argColor, date, time);
    setState(() {
      this.currId = currId;
    });
  }

  void goBack() {
    Navigator.pop(context);
  }

  Future<void> deleteData(int id) async {
    await NoteTemplate().delete(id);
    goBack();
  }

  Future<void> updateData(
      int id, String title, String text, int colorValue, bool argFav) async {
    await getDateTime();
    int value = argFav ? 1 : 0;
    await NoteTemplate().update(id, title, text, colorValue, value, date, time);
  }

  Future<void> getDateTime() async {
    date = await TimeTemplate().getDate();
    time = await TimeTemplate().getTime();
  }

  @override
  Widget build(BuildContext context) {
    colorCode = (colorCode == 0) ? 0xffffffff : colorCode;

    titleControl = TextEditingController(
        text: (clickSliderButton) ? titleControl.text : '');
    textControl = TextEditingController(
        text: (clickSliderButton) ? textControl.text : '');

    return Scaffold(
      backgroundColor: Color(colorCode),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'New Note',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            letterSpacing: 1,
            fontFamily: defaultAppFont,
          ),
        ),
        centerTitle: true,
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
                              icon: const Icon(
                                CupertinoIcons.delete,
                                size: 23,
                              ),
                              onPressed: () async {
                                goBack();
                                await deleteAlert(context,
                                    id: currId,
                                    displayText: "Delete this note?",
                                    goMenu: true);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () async {
                                await create(titleControl.text,
                                    textControl.text, colorCode);
                                goBack();
                                goBack();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(CustomNoti().duplicateNoti());
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () async {
                                setState(() {
                                  clickSliderButton = true;
                                  isFav = !isFav;
                                });

                                await updateData(currId, titleLog, textLog,
                                    colorCode, isFav);

                                goBack();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(CustomNoti().favNoti(isFav));
                              },
                              icon: isFav
                                  ? const Icon(
                                      Icons.star_outlined,
                                      color: Colors.yellow,
                                    )
                                  : const Icon(Icons.star_outline_rounded),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () async {
                                setState(() {
                                  titleLog = titleControl.text;
                                  textLog = textControl.text;
                                  clickSliderButton = true;
                                });
                                if (!isCreated) {
                                  await create(titleLog, textLog, colorCode);
                                  setState(() {
                                    isCreated = true;
                                  });
                                } else {
                                  await updateData(currId, titleLog, textLog,
                                      colorCode, isFav);
                                }
                                goBack();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(CustomNoti().saveNoti());
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
                                      onTap: () async {
                                        setState(() {
                                          colorCode = colorList[index].value;
                                          clickSliderButton = true;
                                        });
                                        await updateData(currId, titleLog,
                                            textLog, colorCode, isFav);
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
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: SingleChildScrollView(
          //reverse: true,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              TextField(
                controller: titleControl,
                autocorrect: isAutoCorrect,
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(fontFamily: defaultAppFont),
                ),
                autofocus: false,
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontSize: 30,
                  fontFamily: defaultAppFont,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: textControl,
                autocorrect: isAutoCorrect,
                autofocus: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Context',
                    hintStyle: TextStyle(
                      fontFamily: defaultAppFont,
                    )),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                cursorColor: Colors.black,
                cursorHeight: 25,
                style: TextStyle(fontSize: 18, fontFamily: defaultAppFont),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
