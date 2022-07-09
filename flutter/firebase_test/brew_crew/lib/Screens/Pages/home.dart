import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/Screens/Pages/brew_list.dart';
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
              actions: <Widget>[
                IconButton(
                    onPressed: () {
                      widget.toggleHomeView();
                    },
                    icon: const Icon(Icons.settings_rounded))
              ],
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
              children: [
                const SizedBox(height: 400),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: coffeeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
