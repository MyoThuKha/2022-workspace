import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Actions Menu",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context, {
                  'favorite': false,
                });
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.home_rounded),
                  title: Text('Home'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, {
                  'favorite': true,
                });
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.star_outlined,
                    color: Colors.yellow,
                  ),
                  title: Text('Favorite'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
