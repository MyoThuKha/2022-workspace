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
  int _current = 1;
  Widget appButton(int id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _current = id;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: id == _current ? coffeeColor : Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            '$id',
            style: TextStyle(
                fontSize: 25,
                color: id == _current ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

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
                icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : Colors.white)),
          ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //main header

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
                  // const SizedBox(height: 10),

                  //how many size

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Size Options",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          appButton(1),
                          const SizedBox(width: 15),
                          appButton(2),
                          const SizedBox(width: 15),
                          appButton(3),
                        ],
                      ),
                    ],
                  ),

                  //Description section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data['about'],
                        style: TextStyle(
                          fontSize: 17,
                          letterSpacing: 1,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  //order buttton
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: double.maxFinite,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "Order",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
