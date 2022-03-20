import 'package:flutter/material.dart';
import 'package:world_time/services/time_template.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<TimeTemplate> locations = [
    TimeTemplate(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    TimeTemplate(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    TimeTemplate(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    TimeTemplate(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    TimeTemplate(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    TimeTemplate(
        url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    TimeTemplate(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    TimeTemplate(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

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
                  onTap: () {},
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/flag.png'),
                ),
              ),
            );
          },
        ));
  }
}
