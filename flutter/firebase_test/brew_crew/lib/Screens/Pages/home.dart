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
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: coffeeColor,
      appBar: AppBar(
        title: const Text(
          "Brew",
          style: TextStyle(fontSize: 40),
        ),
        toolbarHeight: deviceHeight * 15 / 64,
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
