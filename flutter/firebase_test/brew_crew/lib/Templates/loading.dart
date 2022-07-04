import 'package:brew_crew/Templates/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatelessWidget {
  final String text;
  const LoadingPage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: coffeeColor,
      appBar: AppBar(
        toolbarHeight: deviceHeight * 15 / 64,
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        backgroundColor: coffeeColor,
        elevation: 0,
      ),

      //BODY PART
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Center(
          child: LoadingAnimationWidget.inkDrop(color: coffeeColor, size: 50),
        ),
      ),
    );
  }
}
