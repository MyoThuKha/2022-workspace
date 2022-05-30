import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List music = [
    'Harry Potter',
    'Fantastic Beasts1',
    'Harry Potter2',
    'Fantastic Beasts2',
    'Harry Potter3',
    'Fantastic Beasts3',
    'Harry Potter4',
    'Fantastic Beasts4',
    'Harry Potter5',
    'Fantastic Beasts5',
  ];
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Music",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: <Widget>[],
      ),
      body: Row(
        children: <Widget>[
          Material(
            elevation: 2,
            child: Container(
              width: appWidth / 5,
              height: appHeight,
              color: Colors.white,
              child: Column(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: music.length,
              itemBuilder: (context, index) => Container(
                width: appWidth / 5 * 4,
                height: appHeight / 12,
                color: index / 2 == 0 ? Colors.grey : Colors.white,
                child: Text(music[index]),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: appHeight / 8,
        ),
      ),
    );
  }
}
