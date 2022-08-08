/* // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timezone/classAllCountries.dart';




class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
   getDataLoadingPage() async {
    //  info about time

    AllCountries oneCountry =
        AllCountries(countryName: "Egypt", link: "Africa/Cairo");

    await oneCountry.getData();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": oneCountry.timeNow,
      "location": oneCountry.timeZone,
      "isDayTime": oneCountry.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoadingPage();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SpinKitFadingCircle(
              color: const Color.fromARGB(146, 12, 16, 49),
              size: 160.0,
            )
          ],
        ),
      ),
    );
  }
}
 */