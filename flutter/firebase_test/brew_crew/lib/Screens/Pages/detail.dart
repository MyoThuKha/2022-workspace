import 'package:brew_crew/Templates/colors.dart';
import 'package:brew_crew/Templates/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      backgroundColor: customGreyColor,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              width: deviceWidth,
              height: deviceHeight * 3 / 7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/coffee2.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back, color: Colors.white)),
          ),
          Positioned(
            top: 50,
            right: 0,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isFav = !isFav;
                  });
                },
                icon: Icon(
                    isFav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    color: isFav ? Colors.red : Colors.white)),
          ),
          //Fix here
          Positioned(
            top: deviceHeight * 3 / 7 - 30,
            child: Container(
              width: deviceWidth,
              height: deviceHeight * 4 / 7 + 30,
              //for content spacing
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: customGreyColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        data['name'],
                        style: const TextStyle(
                          fontSize: 38,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "\$ ${data['price'].toString()}",
                        style: TextStyle(
                          fontSize: 30,
                          color: coffeeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  //how many
                  Text("Description"),
                  Text(data['about']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
