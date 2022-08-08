import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  Map receivedData = {'timezone': ''};
  getData() async {
    Response receivedDateZoneFromAPI = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo'));
    Map receivedDateZone = jsonDecode(receivedDateZoneFromAPI.body);
    setState(() {
      receivedData = receivedDateZone;
    });
  }

  // getData2() async {
  //   Response receivedDataFromAPI = await get(
  //       Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Cairo'));
  //   Map receivedData = jsonDecode(receivedDataFromAPI.body);

  //   DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);

  //   int offset = int.parse(receivedData["utc_offset"].substring(0, 3));

  //   DateTime realTime = datetime.add(Duration(hours: offset));
  //   // ignore: avoid_print
  //   //print(realTime.hour);
  //   //      13                    13
  //   // if (realTime.hour > 5 && realTime.hour < 18) {
  //   //   bool isDayTime = true;
  //   // } else {
  //   //   bool isDayTime = false;
  //   // }

  //   var timeNow = DateFormat('hh:mm a').format(realTime);
  //   // ignore: avoid_print
  //   //print(timeNow);
  //   // String timeZone = receivedData["timezone"];

  //   return timeNow;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // ignore: avoid_print

                
                  
                  print(receivedData);
             
              },
              child: Text('ali')),
          Text(receivedData["timezone"])
        ],
      ),
    );
  }
}
