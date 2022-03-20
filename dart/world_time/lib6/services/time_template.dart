import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class TimeTemplate {
  String location = "";
  String url = "";
  String time = "";
  bool isDay = false;

  TimeTemplate({required this.location, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.http('worldtimeapi.org', '/api/timezone/$url'));

      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime timeSet = DateTime.parse(dateTime);
      timeSet = timeSet.add(Duration(
        hours: int.parse(offset.substring(1, 3)),
        minutes: int.parse(offset.substring(4, 6)),
      ));

      isDay = timeSet.hour > 6 && timeSet.hour < 18 ? true : false;

      time = DateFormat.jm().format(timeSet);
    } catch (e) {
      if (kDebugMode) {
        print("$e error");
      }
      time = "try again";
    }
  }
}
