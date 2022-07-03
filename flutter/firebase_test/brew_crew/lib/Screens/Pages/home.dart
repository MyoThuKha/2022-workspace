import 'package:brew_crew/Templates/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleHomeView;
  const HomePage({Key? key, required this.toggleHomeView}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: coffeeColor,
      appBar: AppBar(
        title: const Text(
          "Coffee",
          style: TextStyle(fontSize: 40),
        ),
        toolbarHeight: 100,
        backgroundColor: coffeeColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                widget.toggleHomeView();
              },
              icon: const Icon(Icons.settings_rounded))
        ],
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: coffeeColor,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 94, 66, 47),
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1),
                BoxShadow(
                    color: Color.fromARGB(255, 128, 90, 63),
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1),
              ]),
        ),
      ),
    );
  }
}
