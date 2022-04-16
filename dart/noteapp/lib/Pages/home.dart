import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:note_app/services/base.dart';
import 'package:note_app/services/note_template.dart';
import 'package:note_app/services/time.dart';
import 'package:advanced_icon/advanced_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> notes = [];
  bool isLoading = false;
  bool isFavorite = false;
  bool isToday = false;
  String currDay = '';

  @override
  void initState() {
    super.initState();
    refresh(false, false);
  }

  @override
  void dispose() {
    NoteTemplate().close();
    super.dispose();
  }

  Future<void> getDate() async {
    currDay = await TimeTemplate().getDate();
  }

  Future<void> refresh(bool isFavorite, bool isTodayNote) async {
    getDate();
    setState(() {
      isLoading = true;
    });

    if (isFavorite) {
      notes = await NoteTemplate().readNote('favorite', 1);
    } else if (isTodayNote) {
      notes = await NoteTemplate().readNote('date', currDay);
    } else {
      notes = await NoteTemplate().readAllNote();
    }
    /*
    notes = isFavorite
        ? await NoteTemplate().readNote('favorite', 1)
        : await NoteTemplate().readAllNote();
    */
    setState(() {
      notes = notes;
      isLoading = false;
    });
  }

  Color? noteColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    //notes = [];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          isToday
              ? "Today Notes"
              : isFavorite
                  ? "Favorite Notes"
                  : "Notes",
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,

        //AppBar actions button
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/menu');
              setState(() {
                isFavorite = (result == null) ? isFavorite : result['favorite'];
                isToday = (result == null) ? isToday : result['today'];
              });
              refresh(isFavorite, isToday);
            },
            icon: const Icon(Icons.menu_rounded),
            color: Colors.black,
          )
        ],
      ),
      body: isLoading
          ? SpinKitFadingCube(
              color: Colors.blue[300],
              size: 50,
            )
          : Container(
              margin: const EdgeInsets.all(12),
              child: (notes.isEmpty)
                  ? (!isKeyboard
                      ? noNote('No Notes')
                      : null) //see at common.dart
                  : MasonryGridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await Navigator.pushNamed(context, '/edit',
                                arguments: {
                                  'id': notes[index]['id'],
                                  'title': notes[index]['title'],
                                  'context': notes[index]['context'],
                                  'color': notes[index]['color'],
                                  'favorite': notes[index]['favorite']
                                });

                            refresh(isFavorite, isToday);
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                color: Color(notes[index]['color']),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      currDay == notes[index]['date']
                                          ? notes[index]['time']
                                          : notes[index]['date'],
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 10),
                                    ),
                                    const SizedBox(height: 1),
                                    notes[index]['title'] == ''
                                        ? const SizedBox()
                                        : AutoSizeText(
                                            notes[index]['title'],
                                            style: const TextStyle(
                                                fontSize: 25,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w500),
                                            maxLines: null,
                                          ),
                                    const SizedBox(height: 12),
                                    AutoSizeText(
                                      notes[index]['context'],
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400),
                                      minFontSize: 10,
                                      maxFontSize: 14,
                                      maxLines: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/new');
          refresh(isFavorite, isToday);
        },
        child: const AdvancedIcon(
          icon: Icons.add,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellow, Colors.orange]),
          //color: Colors.orange[400],
          size: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
    );
  }
}
