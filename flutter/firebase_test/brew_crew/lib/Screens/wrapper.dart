import 'package:brew_crew/Models/user_model.dart';
import 'package:brew_crew/Screens/AuthPage/auth_page.dart';
import 'package:brew_crew/Screens/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserModel?>(context);
    return userData == null ? const Authenticate() : const HomePage();
    //return TogglePages();
  }
}
