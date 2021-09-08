import 'package:flutter/material.dart';
import 'package:gas_turbine_cycle/pages/home.dart';
import 'package:gas_turbine_cycle/pages/values.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
  runApp(
    MaterialApp(
      initialRoute: '/home',
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/values': (context) => Values(),
      },
    ),
  );
}
