import 'package:brew_crew/Models/brew_model.dart';
import 'package:brew_crew/Models/menu_model.dart';
import 'package:brew_crew/Models/user_model.dart';
import 'package:brew_crew/Services/brewdb.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:brew_crew/Templates/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return StreamBuilder<BrewModel?>(
        stream: DatabaseService(uid: user.uid).brewStreamByUid,
        initialData: null,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('error ${snapshot.error}');
          if (!snapshot.hasData) {
            //loading
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                      color: coffeeColor, size: 50),
                ),
              ),
            );
          }
          BrewModel? userData = snapshot.data;
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 150,
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
                                      userData!.brew,
                                      style: const TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(CupertinoIcons.trash)),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                userData.size,
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
                    child: const Text(
                      "Total : ",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
