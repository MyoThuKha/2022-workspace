import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Templates/colors.dart';
import 'package:brew_crew/Templates/constants.dart';
import 'package:brew_crew/Templates/loading.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  bool _isElevated = true;

  final AuthService _auth = AuthService();

  String _userName = "";
  String _password = "";
  //String errorMessage = "";
  //bool invalidEmail = false;
  bool _isLoading = false;
  bool _startAutoValidate = false;
  bool _userExist = true;
  bool _wrongPassword = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return _isLoading
        ? const LoadingPage(text: "Log In")
        : GestureDetector(
            onTap: (() {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              setState(() {
                _userExist = true;
                _wrongPassword = false;
              });
            }),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: coffeeColor,
              appBar: AppBar(
                toolbarHeight: deviceHeight * 15 / 64,
                title: const Text(
                  "Change",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                backgroundColor: coffeeColor,
                automaticallyImplyLeading: false,
                elevation: 0,
              ),

              //BODY PART
              body: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Form(
                    key: _formkey,
                    autovalidateMode: _startAutoValidate
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: <Widget>[
                        !_userExist
                            ? errorText("User Doesn't Exist")
                            : _wrongPassword
                                ? errorText("Incorrect Password")
                                : const SizedBox(height: 50),
                        userInputBar(false, "User Name"),
                        const SizedBox(height: 30),
                        userInputBar(true, "New Password"),
                        const SizedBox(height: 50),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _isElevated = !_isElevated;
                              _startAutoValidate = true;
                            });
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              dynamic result =
                                  await _auth.logIn(_userName, _password);
                              if (result == "/wrong-password" ||
                                  result == "/invalid-email") {
                                setState(() {
                                  result == "/wrong-password"
                                      ? _wrongPassword = true
                                      : _userExist = false;

                                  _isLoading = false;
                                });
                                //button reappear
                              }
                              await Future.delayed(
                                  const Duration(milliseconds: 800));
                              setState(() {
                                _isElevated = !_isElevated;
                              });
                            }
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
                                  : [
                                      BoxShadow(
                                        color: Colors.grey[500]!,
                                        offset: const Offset(1, 1),
                                        blurRadius: 15,
                                        spreadRadius: 1,
                                      ),
                                      const BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-1, -1),
                                          blurRadius: 15,
                                          spreadRadius: 1)
                                    ],
                            ),
                            // child: Icon(
                            //   _isElevated
                            //       ? Icons.local_cafe_rounded
                            //       : CupertinoIcons.checkmark_alt,
                            //   color: _isElevated ? Colors.black : Colors.green,
                            //   size: 30,
                            // ),
                            child: Icon(
                              _isElevated
                                  ? CupertinoIcons.add
                                  : CupertinoIcons.checkmark_alt,
                              color: _isElevated ? Colors.black : Colors.green,
                              size: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Unsure?",
                                style: TextStyle(fontSize: 15),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Go back",
                                  style: TextStyle(
                                      fontSize: 15, color: coffeeColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  //For Email and Password form
  Widget userInputBar(bool isPassword, String hintText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            offset: const Offset(4, 4),
            blurRadius: 20,
            spreadRadius: 0.5,
          ),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 20,
              spreadRadius: 0.5)
        ],
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        obscureText: isPassword ? true : false,
        keyboardType: !isPassword
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        decoration: customInputDecoration.copyWith(hintText: hintText),
        validator: (val) {
          return isPassword
              ? (val!.isEmpty
                  ? "Password Required"
                  : val.length < 6
                      ? "Password needs more than 6"
                      // : _wrongPassword
                      //     ? "Wrong Password"
                      : null)
              // : (val!.isEmpty ? "Email required" : null);
              : (val!.isEmpty
                  ? "Email required"
                  // : !_userExist
                  //     ? "User doesn't Exist"
                  : null);
        },
        onChanged: (val) {
          setState(() {
            isPassword ? _password = val : _userName = val;
          });
        },
      ),
    );
  }
}
