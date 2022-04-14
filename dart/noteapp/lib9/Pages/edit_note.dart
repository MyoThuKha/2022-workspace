import 'package:flutter/material.dart';
import 'package:note_app/services/note_template.dart';
import 'package:note_app/services/color.dart';
import 'package:note_app/services/time.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  Map data = {};
  bool isUpdate = false;
  String titleLog = '';
  String textLog = '';
  int colorCode = 0;
  //I add 2 as init cause 1 for true and 2 for false.
  bool clickSliderButton = false;
  int isFav = 2;
  String date = '';
  String time = '';

  late TextEditingController titleEditor;
  late TextEditingController contextEditor;

  Future<void> getDateTime() async {
    date = await TimeTemplate().getDate();
    time = await TimeTemplate().getTime();
  }

  Future<void> create(argTitle, argContext, int argColor) async {
    await getDateTime();
    await NoteTemplate().create(argTitle, argContext, argColor, date, time);
  }

  Future<void> deleteData(int id) async {
    await NoteTemplate().delete(id);
    goBack();
  }

  Future<void> updateData(int argId, String argTitle, String argText,
      int argColorCode, argFav) async {
    await getDateTime();
    //data['id'], titleEditor.text, contextEditor.text, colorValue
    await NoteTemplate()
        .update(argId, argTitle, argText, argColorCode, argFav, date, time);
  }

  void goBack() {
    Navigator.pop(context);
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
    isFav = isFav == 2 ? data['favorite'] : isFav;
    Icon favoriteIcon = isFav == 1
        ? const Icon(
            Icons.star_outlined,
            color: Colors.yellow,
          )
        : const Icon(Icons.star_outline_rounded);
    colorCode = (colorCode == 0) ? data['color'] : colorCode;
    titleEditor = TextEditingController(
        text: isUpdate || clickSliderButton ? titleEditor.text : data['title']);
    contextEditor = TextEditingController(
        text: isUpdate || clickSliderButton
            ? contextEditor.text
            : data['context']);

    titleLog = (titleLog == '') ? data['title'] : titleLog;
    textLog = (textLog == '') ? data['context'] : textLog;
    return Scaffold(
      backgroundColor: Color(colorCode),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Edit Note',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(colorCode),
        elevation: 1.0,
        //App Bar Buttons
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () async {
            setState(() {
              titleLog = titleEditor.text;
              textLog = contextEditor.text;
              isUpdate = true;
            });
            await updateData(data['id'], titleLog, textLog, colorCode, isFav);
            goBack();
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //Slider

              //Need to go back twice for closing slider.
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
                              onPressed: () async {
                                await deleteData(data['id']);
                                //goBack once cause deleteData has goBack function.
                                goBack();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () async {
                                await create(titleEditor.text,
                                    contextEditor.text, colorCode);
                                setState(() {
                                  clickSliderButton = true;
                                });
                                goBack();
                                goBack();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: favoriteIcon,
                              onPressed: () async {
                                setState(() {
                                  isFav = (isFav == 0) ? 1 : 0;
                                  clickSliderButton = true;
                                });
                                await updateData(data['id'], titleLog, textLog,
                                    colorCode, isFav);

                                //Close slider
                                goBack();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () async {
                                setState(() {
                                  //for input log
                                  titleLog = titleEditor.text;
                                  textLog = contextEditor.text;
                                });
                                await updateData(data['id'], titleLog, textLog,
                                    colorCode, isFav);
                                setState(() {
                                  isUpdate = true;
                                });

                                //close slider
                                goBack();
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
                                        await updateData(data['id'], titleLog,
                                            textLog, colorCode, isFav);
                                      },
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
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: SingleChildScrollView(
          //reverse: true,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
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
      ),
    );
  }
}
