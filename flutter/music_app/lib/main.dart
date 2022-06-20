import 'package:flutter/material.dart';
import 'package:music_app/Pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => const HomePage(),
    },
  ));
}
