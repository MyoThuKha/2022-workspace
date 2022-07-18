import 'package:brew_crew/Models/menu_model.dart';
import 'package:brew_crew/Services/brewdb.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MenuModel>?>(
        stream: Brewdatabase().menuStream,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('error ${snapshot.error}');
          if (!snapshot.hasData) {
            return Text("No Data here");
          }
          List<MenuModel>? menuData = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: menuData?.length,
            itemBuilder: (context, index) => Column(
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
                            children: <Widget>[
                              Text(
                                menuData![index].name,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                menuData[index].price.toString(),
                                style: const TextStyle(
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
                //Dummy data
              ],
            ),
          );
          // return Center(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[300],
          //       borderRadius: const BorderRadius.vertical(
          //         top: Radius.circular(30),
          //       ),
          //     ),
          //     child: Center(
          //       child: LoadingAnimationWidget.inkDrop(
          //           color: coffeeColor, size: 50),
          //     ),
          //   ),
          // );
        });
  }
}
