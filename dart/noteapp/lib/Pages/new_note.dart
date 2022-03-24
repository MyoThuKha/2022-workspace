import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  String title = 'New Note';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const TextField(
          maxLines: 1,
          decoration: null,
          autofocus: true,
          cursorColor: Colors.black,
          cursorHeight: 30,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 100.0),
        child: TextField(
          decoration: null,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          cursorColor: Colors.black,
          cursorHeight: 25,
          autocorrect: false,
        ),
      ),
    );
  }
}
