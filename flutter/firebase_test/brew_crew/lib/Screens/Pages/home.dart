import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/Models/menu_model.dart';
import 'package:brew_crew/Screens/Pages/coffee.dart';
import 'package:brew_crew/Services/brewdb.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleHomeView;
  const HomePage({Key? key, required this.toggleHomeView}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // with SingleTickerProviderStateMixin {
  // late TabController _tabController;
  @override
  void initState() {
    // _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  Container _customBar() {
    return Container(
      width: 30,
      height: 5,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: coffeeColor,
      ),
    );
  }

  int _currentTab = 1;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return StreamProvider<List<BrewModel>>.value(
      initialData: const [],
      value: DatabaseService(uid: '').brewStream,
      child: StreamProvider<List<MenuModel>>.value(
        initialData: [],
        value: Brewdatabase().menuStream,
        child: Scaffold(
          backgroundColor: coffeeColor,
          appBar: AppBar(
            title: const Text(
              "Brew",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            toolbarHeight: deviceHeight * 15 / 70,
            backgroundColor: coffeeColor,
            elevation: 0,
            // actions: <Widget>[
            //   IconButton(
            //       onPressed: () {}, icon: const Icon(Icons.settings_rounded))
            // ],
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Menu",
                              style:
                                  TextStyle(color: coffeeColor, fontSize: 17),
                            ),
                            const SizedBox(height: 5),
                            _customBar(),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/orders');
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Orders",
                              style:
                                  TextStyle(color: coffeeColor, fontSize: 17),
                            ),
                            // _customBar(),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.toggleHomeView();
                          // Navigator.pushNamed(context, '/settings');
                        },
                        child: Column(
                          children: [
                            Text(
                              "Settings",
                              style:
                                  TextStyle(color: coffeeColor, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const CoffeeList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
