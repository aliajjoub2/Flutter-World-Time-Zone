import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class AllCountries {
 
  final String link;

  AllCountries({ required this.link});

  late bool isDayTime;
  late String timeNow;
  late String timeZone;

  getData() async {
    Response receivedDataFromAPI =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$link'));
    Map receivedData = jsonDecode(receivedDataFromAPI.body);

    DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);

    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));

    DateTime realTime = datetime.add(Duration(hours: offset));
    // ignore: avoid_print
    print(realTime.hour);
    //      13                    13
    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    timeNow = DateFormat('hh:mm a').format(realTime);
    timeZone = receivedData["timezone"];
  }
}
