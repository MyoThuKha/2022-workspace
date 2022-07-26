import 'dart:math';

import 'package:brew_crew/Models/brew_model.dart';
import 'package:brew_crew/Models/menu_model.dart';
import 'package:brew_crew/Models/user_model.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:brew_crew/Templates/load.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    final menus = Provider.of<List<MenuModel>?>(context);
    return StreamBuilder<BrewModel?>(
        stream: DatabaseService(uid: user!.uid).brewStreamByUid,
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('error ${snapshot.error}');

          //loading if data is null
          if (!snapshot.hasData) {
            return loadingWidget();
          }
          BrewModel? userData = snapshot.data;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: menus!.length,
              itemBuilder: (context, index) {
                //this algorithm isn't efficient. (Fix later)
                if (menus[index].name != userData!.brew) {
                  return const SizedBox();
                } else {
                  //add the dessert
                  double cost = menus[index].price;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: 100,
                                margin:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                decoration: BoxDecoration(
                                  color: coffeeColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset("assets/coffee_cup.png"),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Align(
                                  //   alignment: Alignment.topRight,
                                  //   child: IconButton(
                                  //       onPressed: () {},
                                  //       icon: const Icon(CupertinoIcons.trash)),
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          userData.brew,
                                          style: const TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon:
                                              const Icon(CupertinoIcons.trash)),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    userData.size,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    "${menus[index].price}",
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Total : ",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "$cost",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: coffeeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              });
        });
  }
}
