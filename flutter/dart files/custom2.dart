import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Variable section
  Color? colorValue = Colors.blue[100];
  Widget iconValue = const Icon(Icons.nightlight);
  bool isDarkIcon = true;
  Color? backColor = Colors.white;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: const Text("Choose Color Theme"),
        centerTitle: true,
        backgroundColor: colorValue,
        elevation: 0.0,
      ),

      //
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30.0),

            //Button one
            SizedBox(
              width: 300.0,
              height: 80.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[100],
                  shadowColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    colorValue = Colors.blue[100];
                  });
                },
                child: const Text("Blue"),
              ),
            ),
            const SizedBox(height: 30.0),

            //Button two
            SizedBox(
              width: 300.0,
              height: 80.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[100],
                ),
                onPressed: () {
                  setState(() {
                    colorValue = Colors.pink[100];
                  });
                },
                child: const Text("Pink"),
              ),
            ),
            const SizedBox(height: 30.0),

            //Button three
            SizedBox(
              width: 300.0,
              height: 80.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[100],
                ),
                onPressed: () {
                  setState(() {
                    colorValue = Colors.yellow[100];
                  });
                },
                child: const Text("Yellow"),
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (isDarkIcon == true) {
              iconValue = const Icon(Icons.wb_sunny_rounded);
              backColor = Colors.grey[900];
              isDarkIcon = false;
            } else {
              iconValue = const Icon(Icons.nightlight);
              backColor = Colors.white;
              isDarkIcon = true;
            }
          });
        },
        backgroundColor: colorValue,
        child: iconValue,
      ),
    );
  }
}
