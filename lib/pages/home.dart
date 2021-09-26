import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_turbine_cycle/pages/calculation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int dropdownValue = 1;
  bool isVisible = false;
  bool isVisible2 = false;
  int items = 1;
  String dropdownValueJet = 'Turbojet';
  double compressorPressureRatio;
  double ambientPressureP1;
  double turbinePressureRatio;
  String combination1 = 'Combination 1';
  double p2;
  double p3;
  double p4;
  double pT;
  final data = <FlSpot>[];
  double a, b, y;
  List maxValue = [5,15,1,10,3];

  @override
  Widget build(BuildContext context) {
    maxValue.sort();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // print('width is $screenWidth');
     print('max value  is ${maxValue.last}');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text('Gas Turbine Cycle'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Choose one of the jets",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValueJet,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 5,
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 20,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.blue[400],
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueJet = newValue;
                      //print('value is $dropdownValue');
                    });
                  },
                  items: <String>['Turbojet', 'Turbofan', 'Ramjet']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
                ButtonTheme(
                  buttonColor: Colors.blue[400],
                  minWidth: 50.0,
                  height: 30.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // isVisible = true;
                        // items = dropdownValue;
                      });
                      //Navigator.pushNamed(context, '/values');
                    },
                    child: Text(
                      'Choose',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              "Choose combination of input parameters",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton<String>(
                  value: combination1,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 5,
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 20,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.blue[400],
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      combination1 = newValue;
                      //print('value is $dropdownValue');
                    });
                  },
                  items: <String>['Combination 1']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
                ButtonTheme(
                  buttonColor: Colors.blue[400],
                  minWidth: 50.0,
                  height: 30.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isVisible = true;
                        items = dropdownValue;
                      });
                      //Navigator.pushNamed(context, '/values');
                    },
                    child: Text(
                      'Choose',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Visibility(
              visible: isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: SizedBox(
                height: 1800,

                child: Calculation(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
