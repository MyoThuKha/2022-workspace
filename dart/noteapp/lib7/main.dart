import 'package:flutter/material.dart';
import 'package:note_app/Pages/home.dart';
import 'package:note_app/Pages/edit_note.dart';
import 'package:note_app/Pages/new_note.dart';
import 'package:note_app/Pages/menu.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/edit': (context) => const EditNote(),
        '/new': (context) => const NewNote(),
        '/menu': (context) => const MenuPage(),
      },
    ),
  );
}
