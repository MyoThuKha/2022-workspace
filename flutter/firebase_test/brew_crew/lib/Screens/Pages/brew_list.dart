import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<BrewModel>>(context);
    // print(brews?.docs);
    // brews?.forEach((each) {
    //   print(each.name);
    //   print(each.strength);
    //   print(each.sugars);
    // });
    return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                    color: milkColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        offset: const Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.grey[500]!,
                        offset: const Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ]),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.brown[brews[index].strength],
                      ),
                    ),
                    VerticalDivider(color: coffeeColor),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          brews[index].name,
                          style: const TextStyle(
                              fontSize: 18,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
