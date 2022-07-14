import 'package:brew_crew/Templates/colors.dart';
import 'package:flutter/material.dart';

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Coffee part
        Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          // decoration: BoxDecoration(
          //   color: customGreyColor,
          //   borderRadius: BorderRadius.circular(15),
          //   boxShadow: customShadow,
          // ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    color: coffeeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("assets/coffee_cup.png"),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Cappuccino",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "\$1.5",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const Divider(
          indent: 40,
          endIndent: 40,
        ),
        //Coffee part
        Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          // decoration: BoxDecoration(
          //   color: customGreyColor,
          //   borderRadius: BorderRadius.circular(15),
          //   boxShadow: customShadow,
          // ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                    color: coffeeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("assets/coffee_cup.png"),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Espresso",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "\$1.0",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
