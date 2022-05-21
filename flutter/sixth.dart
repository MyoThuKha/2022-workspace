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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text("Button"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Button"),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(60.0),
            color: Colors.blue[100],
            child: const Text("first box"),
          ),
          Container(
            padding: const EdgeInsets.all(60.0),
            color: Colors.pink[100],
            child: const Text("second box"),
          ),
          Container(
            padding: const EdgeInsets.all(60.0),
            color: Colors.yellow[300],
            child: const Text("third box"),
          ),
        ],
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
