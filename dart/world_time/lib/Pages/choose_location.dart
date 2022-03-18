import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  void getData() async {
    await Future.delayed(const Duration(seconds: 3), () {
      print("Delayed data");
    });

    String data2 = await Future.delayed(const Duration(seconds: 2), () {
      return "Delayed data2";
    });

    print("data set 2 - $data2");
    print("Data");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          const Text("Working in Progress"),
        ],
      ),
    );
  }
}
