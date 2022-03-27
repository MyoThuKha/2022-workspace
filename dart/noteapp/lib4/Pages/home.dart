import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:note_app/services/note.dart';
import 'package:note_app/services/note_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textList = [];
  List<Note> notes = [];

  Future<void> refresh() async {
    notes = await NotesDatabase.instance.readAllNotes();
  }

  Color? noteColor = Colors.grey[300];

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Notes",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1.0,

          //AppBar actions button
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu_rounded),
              color: Colors.black,
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          color: Colors.black,
          child: Container(
            margin: const EdgeInsets.all(12),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/edit', arguments: {
                        'title': notes[index].title,
                        'text': notes[index].context,
                      });
                      ;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      color: noteColor,
                      child: Column(
                        children: <Widget>[
                          AutoSizeText(
                            notes[index].title,
                            style: const TextStyle(fontSize: 20),
                            minFontSize: 15,
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            notes[index].context,
                            style: const TextStyle(fontSize: 20),
                            minFontSize: 15,
                            maxLines: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new');
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
