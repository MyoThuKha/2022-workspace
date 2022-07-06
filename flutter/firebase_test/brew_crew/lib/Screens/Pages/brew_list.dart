import 'package:brew_crew/Models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<BrewModel>?>(context);
    // print(brews?.docs);
    brews?.forEach((each) {
      print(each.name);
      print(each.strength);
      print(each.sugars);
    });
    return Container();
  }
}
