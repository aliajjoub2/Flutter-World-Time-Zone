import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map receivedData = {
    'timezone': 'Berlin',
    'datetime': DateTime.now().hour.toString()
  };
  Map time = {"location": "Africa/Johannesburg"};

  String timeNow = '${DateTime.now().hour}:${DateTime.now().minute}';

  @override
  Widget build(BuildContext context) {
    //                                    DATA from loading page
    // data = data.isEmpty? ModalRoute.of(context)!.settings.arguments as Map : data ;
    // {     "time": timeNow ,     "location": timeZone,    "isDayTime": false  }
    // String bgimg = data["isDayTime"] ? "back.jpg" : "light.jpg";
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 55, 53, 63),
          // ignore: prefer_const_constructors
          image: DecorationImage(
              // ignore: prefer_const_constructors
              image: AssetImage("assets/light.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  print(
                      result); // recive this result = {location: Africa/Cairo}
                  String location = result['location'];

                  // start Location
                  Response receivedDateZoneFromAPI = await get(Uri.parse(
                      'http://worldtimeapi.org/api/timezone/$location'));
                  Map receivedDateZone =
                      jsonDecode(receivedDateZoneFromAPI.body);
                  setState(() {
                    receivedData = receivedDateZone;
                    DateTime datetime =
                        DateTime.parse(receivedData["utc_datetime"]);

                    int offset =
                        int.parse(receivedData["utc_offset"].substring(0, 3));

                    DateTime realTime = datetime.add(Duration(hours: offset));
                    timeNow = DateFormat('hh:mm a').format(realTime);
                  });
                },
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.edit_location,
                  color: const Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: const Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(146, 90, 103, 223)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                )),
            const SizedBox(
              height: 300,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 33),
              color: const Color.fromARGB(111, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    timeNow,
                    style: const TextStyle(fontSize: 55, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    receivedData['timezone'],
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
