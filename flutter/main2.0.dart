import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Title"),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: Center(
        child: Image.asset('assets/light.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.mode_night_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.blue[100],
      ),
    );
  }
}
