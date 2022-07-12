import 'package:brew_crew/Models/brew.dart';
import 'package:brew_crew/Models/user_model.dart';
import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Services/database.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:brew_crew/Templates/constants.dart';
import 'package:brew_crew/Templates/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  final VoidCallback toggleHomeView;
  const Settings({Key? key, required this.toggleHomeView}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isElevated = true;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    return StreamBuilder<BrewModel>(
      stream: DatabaseService(uid: user.uid).userDocStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          BrewModel? userData = snapshot.data;
          return Scaffold(
            backgroundColor: customGreyColor,

            //appBar area
            appBar: AppBar(
              title: const Text(
                ("Settings"),
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  widget.toggleHomeView();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              ),
              backgroundColor: customGreyColor,
              toolbarHeight: 100,
            ),

            //Body area
            body: Center(
              child: Column(
                children: <Widget>[
                  //will add name
                  const Text("Lorem Ipsum"),
                  const SizedBox(height: 50),

                  //
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: customGreyColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: customShadow,
                    ),
                    child: const Icon(CupertinoIcons.pencil),
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          _isElevated = !_isElevated;
                        });
                        await Future.delayed(const Duration(milliseconds: 250));
                        await _auth.signOut();
                      },
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: _isElevated
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey[500]!,
                                        offset: const Offset(4, 4),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                      const BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4, -4),
                                          blurRadius: 15,
                                          spreadRadius: 1)
                                    ]
                                  : null),
                          child: const Icon(
                            Icons.exit_to_app_rounded,
                            size: 30,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const LoadingPage(text: "brew");
        }
      },
    );
  }
}
