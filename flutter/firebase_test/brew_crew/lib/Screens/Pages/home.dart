import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/Screens/Pages/brew_list.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:brew_crew/Templates/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleHomeView;
  const HomePage({Key? key, required this.toggleHomeView}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return StreamProvider<List<BrewModel>>.value(
      initialData: const [],
      value: DatabaseService(uid: '').brewStream,
      child: Scaffold(
        backgroundColor: coffeeColor,
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
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
          ],
          body: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Column(
              children: <Widget>[
                //Header Navigation
                Container(
                  // color: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Menu",
                          style: TextStyle(color: coffeeColor, fontSize: 17),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Orders",
                          style: TextStyle(color: coffeeColor, fontSize: 17),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.toggleHomeView();
                        },
                        child: Text(
                          "Settings",
                          style: TextStyle(color: coffeeColor, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

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
                          height: 100,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: BoxDecoration(
                            color: coffeeColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset("assets/cappuccino.png"),
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
                          height: 100,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: BoxDecoration(
                            color: coffeeColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset("assets/espresso.png"),
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

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
