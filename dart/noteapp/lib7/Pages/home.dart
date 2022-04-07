import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:note_app/services/note_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> notes = [];
  bool isLoading = false;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    refresh(false);
  }

  @override
  void dispose() {
    NoteTemplate().close();
    super.dispose();
  }

  Future<void> refresh(bool isFavorite) async {
    setState(() {
      isLoading = true;
    });

    notes = isFavorite
        ? await NoteTemplate().readFav()
        : await NoteTemplate().readAllNote();
    setState(() {
      notes = notes;
      isLoading = false;
    });
  }

  Color? noteColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    /*
    notes = notes.isEmpty
        ? ModalRoute.of(context)?.settings.arguments as Map
        : notes;
        */
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/menu');
              setState(() {
                isFavorite = result['favorite'];
              });
              refresh(result['favorite']);
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
              child: MasonryGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(context, '/edit', arguments: {
                        'id': notes[index]['id'],
                        'title': notes[index]['title'],
                        'context': notes[index]['context'],
                        'color': notes[index]['color'],
                        'favorite': notes[index]['favorite']
                      });

                      refresh(isFavorite);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        color: Color(notes[index]['color']),
                        child: Column(
                          children: <Widget>[
                            AutoSizeText(
                              notes[index]['title'],
                              style: const TextStyle(
                                  fontSize: 25, letterSpacing: 1),
                              maxLines: 1,
                            ),
                            const SizedBox(height: 12),
                            AutoSizeText(
                              notes[index]['context'],
                              style: const TextStyle(fontSize: 18),
                              minFontSize: 10,
                              maxFontSize: 14,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/new');
          refresh(isFavorite);
        },
        child: Icon(
          Icons.add,
          color: Colors.orange[400],
          size: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
    );
  }
}
