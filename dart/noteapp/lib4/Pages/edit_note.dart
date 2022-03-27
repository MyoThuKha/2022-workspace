import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  Map data = {};
  String title = 'New Note';
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const TextField(
          maxLines: 1,
          decoration: null,
          autofocus: true,
          cursorColor: Colors.black,
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
