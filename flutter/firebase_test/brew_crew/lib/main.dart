import 'package:brew_crew/Models/user_model.dart';
import 'package:brew_crew/Screens/Pages/settings.dart';
import 'package:brew_crew/Screens/Pages/update.dart';
import 'package:brew_crew/Screens/wrapper.dart';
import 'package:brew_crew/Services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().userStream,
      initialData: null,
      catchError: (_, __) {},
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/settings': (context) => const Settings(),
          '/update': (context) => const UpdatePage(),
        },
        // home: Wrapper(),
      ),
    );
  }
}
