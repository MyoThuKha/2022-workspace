import 'package:flutter/material.dart';

void main() {
  return runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello world"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.fromLTRB(80.0, 20.0, 20.0, 80.0),
        color: Colors.grey[200],
        child: const Text("Hello my name is Myo Thu Kha."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.abc_rounded,
        ),
      ),
    );
  }
}

