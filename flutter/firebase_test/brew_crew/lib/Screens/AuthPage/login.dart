import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[400],
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text(
          "Log in",
          style: TextStyle(fontSize: 40),
        ),
        backgroundColor: Colors.brown[400],
        elevation: 0,
      ),

      //BODY PART
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isElevated = !_isElevated;
              });
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: _isElevated
                      ? [
                          BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1)
                        ]
                      : null,
                ),
                child: Icon(
                  _isElevated
                      ? CupertinoIcons.person_solid
                      : CupertinoIcons.checkmark_alt,
                  size: 30,
                )),
          ),
        ),
      ),
    );
  }
}
