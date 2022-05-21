import 'package:flutter/material.dart';
import 'package:world_time/services/time_template.dart';

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
        location: 'Myanmar', url: 'Asia/Yangon', flag: 'myanmar.png');
    await instance.getTime();
    time = instance.time;
    //2022-03-19 18:33:41.322756Z
    timeClock = time.substring(11, 19);
    print(time);
  }

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
        children: <Widget>[
          Center(
            child: Text(
              timeClock,
              style: const TextStyle(fontSize: 20.0, letterSpacing: 3.0),
            ),
          ),
        ],
      ),
    );
  }
}
