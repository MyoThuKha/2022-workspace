import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
//import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List music = [
    'Harry Potter',
    'Fantastic Beasts1',
    'Harry Potter2',
    'Fantastic Beasts2',
    'Harry Potter3',
    'Fantastic Beasts3',
    'Harry Potter4',
    'Fantastic Beasts4',
    'Harry Potter5',
    'Fantastic Beasts5',
  ];
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    double appHeight = MediaQuery.of(context).size.height;
    return Container(
      child: NavigationView(
        appBar: NavigationAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: Row()),
        pane: NavigationPane(
          displayMode: PaneDisplayMode.auto,
        ),
        content: ScaffoldPage(
          content: NavigationBody(
            index: 0,
            children: <Widget>[
              Container(
                width: appWidth,
                height: appHeight,
                child: const Text(
                  "Hello",
                ),
              )
            ],
          ),
          bottomBar: BottomNavigation(
            index: 0,
            items: const [
              BottomNavigationItem(
                icon: Icon(material.Icons.two_k),
                selectedIcon: Icon(material.Icons.two_k_plus),
                title: Text('Both'),
              ),
              BottomNavigationItem(
                icon: Icon(material.Icons.phone_android_outlined),
                selectedIcon: Icon(material.Icons.phone_android),
                title: Text('Android'),
              ),
              BottomNavigationItem(
                icon: Icon(material.Icons.phone_iphone_outlined),
                selectedIcon: Icon(material.Icons.phone_iphone),
                title: Text('iOS'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
