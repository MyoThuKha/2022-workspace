import 'package:brew_crew/Templates/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Barista extends StatefulWidget {
  const Barista({Key? key}) : super(key: key);

  @override
  State<Barista> createState() => _BaristaState();
}

class _BaristaState extends State<Barista> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: customGreyColor,
      appBar: AppBar(
        backgroundColor: customGreyColor,
        automaticallyImplyLeading: false,
        toolbarHeight: _deviceHeight * 7 / 64,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          "Barista Brew",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
