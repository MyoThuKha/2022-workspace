import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/services/base.dart';

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
                  'today': false,
                });
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.home_rounded),
                  title: Text('Home'),
                ),
              ),
            ),

            //Search
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Card(
                child: ListTile(
                  leading: CustomIcon().searchIcon(),
                  title: const Text('Search'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, {
                  'favorite': true,
                  'today': false,
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
            //Today
            GestureDetector(
              onTap: () {
                Navigator.pop(context, {
                  'favorite': false,
                  'today': true,
                });
              },
              child: Card(
                child: ListTile(
                  leading: CustomIcon().todayIcon(),
                  title: const Text('Today'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/setting');
              },
              child: Card(
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.settings,
                    color: Colors.grey[800],
                  ),
                  title: const Text('Settings'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
