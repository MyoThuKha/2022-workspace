import 'package:flutter/material.dart';
import 'package:note_app/services/common.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

TextEditingController search = TextEditingController();

Color? searchColor = Colors.grey[200];

OutlineInputBorder searchBar() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
    borderSide: BorderSide(color: (searchColor)!),
  );
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Search",
          style: TextStyle(color: Colors.blue[300], fontSize: 40),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      */
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Notes",
                style: TextStyle(color: Colors.blue[300], fontSize: 40),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    fillColor: searchColor,
                    filled: true,
                    hintText: "Search Notes",
                    prefixIcon: searchIcon(),
                    enabledBorder: searchBar(),
                    focusedBorder: searchBar(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
