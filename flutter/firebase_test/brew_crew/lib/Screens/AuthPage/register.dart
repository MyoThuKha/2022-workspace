import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Services/colors.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatefulWidget {
  final VoidCallback toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isElevated = true;

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: milkColor!),
    );
  }

  OutlineInputBorder customFocusBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey[600]!));
  }

  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String errorMessage = "";
  bool invalidEmail = false;
  bool _startAutoValidate = false;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: coffeeColor,
        appBar: AppBar(
          toolbarHeight: deviceHeight * 15 / 64,
          title: const Text(
            "JOIN Us",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          backgroundColor: coffeeColor,
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
                  const SizedBox(height: 50),
                  userInputBar(false, "Email"),
                  const SizedBox(height: 30),
                  userInputBar(true, "Password"),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        _isElevated = !_isElevated;
                        _startAutoValidate = true;
                      });
                      // dynamic result = await _auth.signAsAnys();
                      // if (result == null) {
                      //   print("Failed");
                      // } else {
                      //   print("Success");
                      //   print(result.uid);
                      // }
                      if (_formkey.currentState!.validate()) {
                        dynamic result =
                            await _auth.CreateAccount(email, password);
                        setState(() {
                          invalidEmail = (result == null) ? true : false;
                        });
                      }
                      //button reappear
                      await Future.delayed(const Duration(milliseconds: 800));
                      setState(() {
                        _isElevated = !_isElevated;
                      });
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
                      child: Center(
                          child: _isElevated
                              ? const FaIcon(FontAwesomeIcons.mugHot)
                              : (!invalidEmail
                                  ? const Icon(
                                      CupertinoIcons.checkmark_alt,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      CupertinoIcons.clear_thick,
                                      color: Colors.red,
                                    ))),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Go back to",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: Text(
                            "Log in Page",
                            style: TextStyle(fontSize: 15, color: coffeeColor),
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
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
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: milkColor,
          filled: true,
          border: customFocusBorder(),
          focusedBorder: customFocusBorder(),
          enabledBorder: customBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          focusedErrorBorder: customFocusBorder(),
        ),
        validator: (val) {
          return isPassword
              ? (val!.isEmpty
                  ? "Password Required"
                  : val.length < 6
                      ? "Password must contain more than 6"
                      : null)
              : (val!.isEmpty
                  ? "Email required"
                  : invalidEmail
                      ? "Invalid Email"
                      : null);
        },
        onChanged: (val) {
          setState(() {
            isPassword ? password = val : email = val;
          });
        },
      ),
    );
  }
}
