import 'package:brew_crew/Services/auth.dart';
import 'package:brew_crew/Services/colors.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: milkColor,
      body: Center(
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
    );
  }
}
