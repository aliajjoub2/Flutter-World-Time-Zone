// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import "package:timezone/all_country.dart";

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String clickedCountry = '';
  String timeNow = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(146, 12, 16, 49),
        title: Text(
          "Choose Location",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SizedBox(
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: allCountries.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: ()  {
                    String location = allCountries[index];
                     Navigator.pop(context,
                         {
                          
                          'location': location,
                          
                        }); 
                  },
                  title: Text(
                    allCountries[index],
                    // allCountries[index].countryName,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
