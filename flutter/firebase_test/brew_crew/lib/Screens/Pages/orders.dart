import 'package:brew_crew/Models/brew_model.dart';
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
  List<String> sizeList = ['None', 'Small', 'Medium', 'Large'];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    final userData = Provider.of<BrewModel?>(context);
    // return StreamBuilder<BrewModel?>(
    //     stream: DatabaseService(uid: user!.uid).brewStreamByUid,
    //     initialData: null,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) return Text('error ${snapshot.error}');

    //       //loading if data is null
    //       if (!snapshot.hasData) {
    //         return loadingWidget();
    //       }
    //       BrewModel? userData = snapshot.data;

    //Fixed with better algorithm(added price to db)
    return userData == null
        ? loadingWidget()
        : Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  (userData.brew.isEmpty)
                      ? const SizedBox()
                      : Container(
                          height: 150,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                    // image: const DecorationImage(
                                    //   image:
                                    //       AssetImage("assets/coffee_cup.png"),
                                    //   fit: BoxFit.contain,
                                    // ),
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
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
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
                                              onPressed: () async {
                                                await DatabaseService(
                                                        uid: user!.uid)
                                                    .updateUserData(
                                                  userData.name,
                                                  userData.barista,
                                                  "",
                                                  0,
                                                  [0, userData.cost[1]],
                                                  userData.favorite,
                                                );
                                              },
                                              icon: const Icon(
                                                  CupertinoIcons.trash)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text(
                                        //   "\$ ${userData.cost[0]}",
                                        //   style: const TextStyle(
                                        //     fontSize: 17,
                                        //   ),
                                        // ),
                                        Text(
                                          sizeList[userData.size],
                                          style: const TextStyle(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                  //if the brew doesn't exist.
                  const Divider(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Total : ",
                          style: TextStyle(
                            fontSize: 40,
                            color: coffeeColor,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          (userData.brew.isEmpty)
                              ? "${userData.cost[0] + userData.cost[1]}"
                              : "${userData.cost[0] + userData.cost[1] + (2 * (userData.size - 1))}",
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
              ),
            ),
          );
    // });
  }
}
