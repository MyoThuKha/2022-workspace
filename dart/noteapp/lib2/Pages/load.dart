import 'package:flutter/material.dart';

//import 'package:note_app/services/data.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};
  void getData() async {
    await Navigator.pushReplacementNamed(context, '/edit', arguments: {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    return const Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
