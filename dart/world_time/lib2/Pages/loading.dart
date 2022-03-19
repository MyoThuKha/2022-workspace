import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Response response =
        await get(Uri.http('worldtimeapi.org', '/api/timezone/Asia/Yangon'));

    Map data = jsonDecode(response.body);
    //print(data['datetime']);
    String dateTime = data['datetime'];
    String offsetTime = data['utc_offset'];

    //for clear look
    int offsetH = int.parse(offsetTime.substring(1, 3));
    int offsetMin = int.parse(offsetTime.substring(4, 6));

    DateTime timeSet = DateTime.parse(dateTime);
    timeSet = timeSet.add(Duration(hours: offsetH, minutes: offsetMin));
    print(timeSet);
  } //getData()

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: Text(
              "loading...",
              style: TextStyle(fontSize: 20.0, letterSpacing: 3.0),
            ),
          ),
        ],
      ),
    );
  }
}
