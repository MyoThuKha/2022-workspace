import 'package:flutter/material.dart';
import 'package:world_time/services/time_template.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";
  String timeClock = "Loading...";
  void getData() async {
    TimeTemplate instance = TimeTemplate(
        location: 'Yangon', url: 'Asia/Yangon', flag: 'myanmar.png');
    await instance.getTime();
    setState(() {
      time = instance.time;
    });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}
