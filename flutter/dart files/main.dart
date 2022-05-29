import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("App Title"),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: const Center(
        child: Text(
          "Content Here",
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text(
          "+",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.blue[100],
      ),
    ),
  ));
}
