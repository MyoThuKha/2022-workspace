import 'package:brew_crew/Models/brew_model.dart';
import 'package:brew_crew/Models/user_model.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:brew_crew/Templates/constants.dart';
import 'package:brew_crew/Templates/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _current = 1;
  List<String> _images = [
    "assets/coffee.jpg",
    "assets/coffee1.jpeg",
    "assets/coffee2.jpeg",
    "assets/coffee3.jpeg",
    "assets/coffee4.jpeg",
    "assets/coffee5.jpeg",
    "assets/coffee6.jpeg",
    "assets/coffee7.jpeg",
    "assets/coffee8.jpeg",
  ];

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    Map menuData = ModalRoute.of(context)?.settings.arguments as Map;
    UserModel? user = Provider.of(context);

    String imagePath = (_images.toList()..shuffle()).first;
    return StreamBuilder<BrewModel>(
        stream: DatabaseService(uid: user!.uid).brewStreamByUid,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            BrewModel? userData = snapshot.data;
            return Scaffold(
              backgroundColor: customGreyColor,
              body: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    child: Container(
                      width: deviceWidth,
                      height: deviceHeight * 3 / 7,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(CupertinoIcons.back,
                            color: Colors.white)),
                  ),
                  Positioned(
                    top: 50,
                    right: 0,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : Colors.white)),
                  ),
                  Positioned(
                    top: deviceHeight * 3 / 7 - 30,
                    child: Container(
                      width: deviceWidth,
                      height: deviceHeight * 4 / 7 + 30,
                      //for content spacing
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      decoration: BoxDecoration(
                        color: customGreyColor,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //main header

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    menuData['name'],
                                    style: const TextStyle(
                                      fontSize: 38,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  "\$ ${menuData['price'].toString()}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: coffeeColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            //how many size

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Size Options",
                                  style: TextStyle(
                                    fontSize: 25,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    appButton(1),
                                    const SizedBox(width: 15),
                                    appButton(2),
                                    const SizedBox(width: 15),
                                    appButton(3),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),
                            //Description section
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Description",
                                  style: TextStyle(
                                    fontSize: 30,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  menuData['about'],
                                  style: TextStyle(
                                    fontSize: 17,
                                    letterSpacing: 1,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),
                            //order buttton
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Material(
                                color: coffeeColor,
                                child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () async {
                                    await DatabaseService(uid: user.uid)
                                        .updateUserData(
                                            userData!.name,
                                            userData.barista,
                                            menuData['name'],
                                            _current.toString());
                                  },
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    width: double.maxFinite,
                                    height: 65,
                                    // decoration: BoxDecoration(
                                    // color: Colors.orange,
                                    // borderRadius: BorderRadius.circular(30),
                                    // ),
                                    child: const Center(
                                      child: Text(
                                        "Order",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const LoadingPage(text: "Please Wait");
          }
        });
  }

  //custom buttom for size
  Widget appButton(int id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _current = id;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: id == _current ? coffeeColor : Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            '$id',
            style: TextStyle(
                fontSize: 25,
                color: id == _current ? Colors.white : Colors.grey[850]),
          ),
        ),
      ),
    );
  }
}
