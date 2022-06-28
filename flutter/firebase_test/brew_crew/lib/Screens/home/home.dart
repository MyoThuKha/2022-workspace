import 'package:brew_crew/Services/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, '/settings');
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
              boxShadow: [
                BoxShadow(
                    color: Colors.brown[800]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1),
                BoxShadow(
                    color: Colors.brown[600]!,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1),
              ]),
        ),
      ),
    );
  }
}
