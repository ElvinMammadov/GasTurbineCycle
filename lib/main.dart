import 'package:flutter/material.dart';
import 'package:gas_turbine_cycle/pages/home.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
  runApp(
    MaterialApp(
      initialRoute: '/home',
      home: Home(),
      routes: {
        '/home': (context) => Home(),
      },
    ),
  );
}
