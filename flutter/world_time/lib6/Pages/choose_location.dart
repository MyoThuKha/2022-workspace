import 'package:flutter/material.dart';
import 'package:world_time/services/time_template.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<TimeTemplate> locations = [
    TimeTemplate(url: 'Europe/Berlin', location: 'Athens'),
    TimeTemplate(url: 'Africa/Cairo', location: 'Cairo'),
    TimeTemplate(url: 'America/Chicago', location: 'Chicago'),
    TimeTemplate(url: 'Asia/Jakarta', location: 'Jakarta'),
    TimeTemplate(url: 'Europe/London', location: 'London'),
    TimeTemplate(url: 'Africa/Nairobi', location: 'Nairobi'),
    TimeTemplate(url: 'America/New_York', location: 'New York'),
    TimeTemplate(url: 'Asia/Seoul', location: 'Seoul'),
    TimeTemplate(url: 'Asia/Yangon', location: 'Yangon')
  ];

  void updateTime(index) async {
    TimeTemplate instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDay': instance.isDay,
    });
  }

  String url = '';
  String location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Choose Location"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          },
        ));
  }
}
