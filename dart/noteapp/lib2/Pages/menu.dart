import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/services/base.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !isDarkMode ? lightAppColor : darkAppColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Actions Menu",
          style: TextStyle(
              color: !isDarkMode ? Colors.black : Colors.white,
              fontFamily: defaultAppFont),
        ),
        backgroundColor: !isDarkMode ? Colors.white : darkAppBar,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            children: <Widget>[
              //Home
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, {
                    'favorite': false,
                    'today': false,
                  });
                },
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.home_rounded),
                    title: Text(
                      'Home',
                      style: TextStyle(fontFamily: defaultAppFont),
                    ),
                  ),
                ),
              ),

              //Search
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Card(
                  child: ListTile(
                    leading: CustomIcon().searchIcon(),
                    title: Text(
                      'Search',
                      style: TextStyle(fontFamily: defaultAppFont),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, {
                    'favorite': true,
                    'today': false,
                  });
                },
                child: Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.star_outlined,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      'Favorite',
                      style: TextStyle(fontFamily: defaultAppFont),
                    ),
                  ),
                ),
              ),
              //Today
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, {
                    'favorite': false,
                    'today': true,
                  });
                },
                child: Card(
                  child: ListTile(
                    leading: CustomIcon().todayIcon(),
                    title: Text(
                      'Today',
                      style: TextStyle(fontFamily: defaultAppFont),
                    ),
                  ),
                ),
              ),

              //SortBy
              GestureDetector(
                onTap: () {
                  setState(() {
                    isASC = !isASC;
                    orderBy = isASC ? 'ASC' : 'DESC';
                  });
                },
                child: Card(
                  child: ListTile(
                    leading: CustomIcon().sortIcon(),
                    title: Text(
                      'Sort',
                      style: TextStyle(fontFamily: defaultAppFont),
                    ),
                  ),
                ),
              ),
              //setting
              GestureDetector(
                onTap: () async {
                  await Navigator.pushNamed(context, '/setting');
                  //.then((_) => setState(() {}));
                  setState(() {});
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      CupertinoIcons.settings,
                      color: Colors.grey[800],
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(fontFamily: defaultAppFont),
                    ),
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
