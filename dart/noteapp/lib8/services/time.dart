import 'package:intl/intl.dart';

class TimeTemplate {
  String time = '';

  Future<void> getTime() async {
    DateTime now = DateTime.now();
    time = DateFormat.jm().format(now);
    print(time);
    print('${now.day}, ${now.month}');
  }
}
