import 'package:brew_crew/Templates/colors.dart';
import 'package:brew_crew/Templates/constants.dart';
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
  String name = "";
  int price = 0;
  String _about = "";

  @override
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  _userInputBar("Brew", 1),
                  const SizedBox(height: 30),
                  _userInputBar("Price", 2),
                  const SizedBox(height: 30),
                  SizedBox(
                      height: _deviceHeight * 1 / 2,
                      child: _userInputBar("About", 3)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userInputBar(String hintText, int boxNum) {
    return searchBoxContainer(
      searchField: TextFormField(
        validator: (val) {
          (val!.isEmpty) ? "Fill Here" : null;
        },
        onChanged: (val) {
          setState(() {});
        },
        cursorColor: Colors.black,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: customGreyColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          border: customBorder(),
          enabledBorder: customBorder(),
          focusedBorder: customBorder(),
          focusedErrorBorder: customBorder(),
        ),
      ),
    );
  }
}
