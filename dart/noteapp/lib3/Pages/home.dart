import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:note_app/services/note_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textList = [];
  Map data = {};

  Future<void> refresh() async {
    Future.delayed(const Duration(seconds: 10));
    NoteTemplate instance = NoteTemplate();
    var listData = await instance.getAllData();
    data = listData.map((json) => json).toList();
  }

  Color? noteColor = Colors.grey[300];

  @override
  void initState() {
    super.initState();
    refresh();
    print(data);
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
              itemCount: textList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/edit', arguments: {
                        'title': textList[index],
                        'text': textList[index],
                      });
                      ;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      color: noteColor,
                      child: AutoSizeText(
                        textList[index],
                        style: const TextStyle(fontSize: 20),
                        minFontSize: 15,
                        maxLines: 8,
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
