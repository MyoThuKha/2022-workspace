import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Pages/home.dart';

void main() {
  runApp(FluentApp(
    title: "Music App",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
