// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/pages/locations.dart';
import './pages/home.dart';
import './pages/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Loading(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => const Home(),
        '/list': (context) => const Locations(),
      },
    ),
  );
}
