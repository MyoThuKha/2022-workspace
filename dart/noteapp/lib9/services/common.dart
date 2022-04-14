import 'package:advanced_icon/advanced_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget noNote() {
  return Container(
    margin: const EdgeInsets.only(bottom: 56),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /*
        Center(
          child: Image.asset(
            'assets/Images/iceCoffee.png',
            scale: 12,
          ),
        ),
        */
        Center(
          child: const Text(
            "No Notes Here! ツ",
            style: TextStyle(fontSize: 20, letterSpacing: 1),
          ),
        )
      ],
    ),
  );
}

//Icon depertment
Widget searchIcon() {
  return const AdvancedIcon(
    icon: Icons.search_rounded,
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.green, Colors.blue]),
  );
}

Widget todayIcon() {
  return const AdvancedIcon(
    icon: CupertinoIcons.cloud_sun_fill,
    size: 30,
    gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.red, Colors.yellow]),
  );
}
