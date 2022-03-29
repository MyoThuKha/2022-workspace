import 'package:flutter/material.dart';
import 'package:note_app/Pages/home.dart';
import 'package:note_app/Pages/edit_note.dart';
import 'package:note_app/Pages/new_note.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/edit': (context) => const EditNote(),
        '/new': (context) => const NewNote(),
      },
    ),
  );
}