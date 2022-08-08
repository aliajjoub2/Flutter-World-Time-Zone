
import 'package:flutter/material.dart';
import 'package:timezone/api.dart';

import 'home.dart';
//import 'Loading.dart';
import 'location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
         '/location' : (context) => const Location(),
         '/home':(context) => const Home(),
         '/api':(context) => const Api(),
         
      }
     
      
    );
  }
}


