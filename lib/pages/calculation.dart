import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  int dropdownValue = 1;
  bool isVisible = false;
  int items = 1;

  String dropdownValueJet = 'Turbojet';
  double compressorPressureRatio,
      ambientPressureP1,
      turbinePressureRatio,
      cycleTemperature3,
      ambientTemperatureT1,
      heatRatio,
      gasConstantOfAir,
      pressureDev1,
      pressureDev2;
  double p2, p3, p4, pT, t2, t4;
  double calculatedHeatRatio;
  final dataPV = <FlSpot>[];
  final dataTS = <FlSpot>[];
  double a, b, y;
  double v1, v2, v3, v4, s1, s2, s3, s4;
  String newV1, newV2, newV3, newV4;
  String newT1, newT2, newT3, newT4;
  String newS1, newS2, newS3, newS4;
  int cp = 1004;
  double divisionT1T4, divisionT3T2;
  List maxValue = [];
  double maxP, maxV;
  double maxT, maxS, minS;

  double calculationPV(double xMin, double yMin, double xMax, double yMax) {
    int xSeparatorItem = 20;
    double xSeparatorValue = (xMax - xMin) / xSeparatorItem;
    double sqrt = xMax - xMin;
    double newX = xMin;
    dataPV.add(FlSpot(xMin, yMin));
    double divisionValue = yMax / yMin;

    if (xMin == xMax) {
      dataPV.add(FlSpot(xMax, yMax));
    } else if (yMin == yMax) {
      dataPV.add(FlSpot(xMax, yMax));
    } else {
      b = pow(divisionValue, 1 / sqrt);
      a = yMin / pow(b, xMin);

      for (int i = 0; i < xSeparatorItem; i++) {
        newX += xSeparatorValue;
        y = a * pow(b, newX);
        dataPV.add(FlSpot(newX, y));
      }
    }
    return y;
  }

  double calculationTS(double xMin, double yMin, double xMax, double yMax) {
    int xSeparatorItem = 20;
    double xSeparatorValue = (xMax - xMin) / xSeparatorItem;
    double sqrt = xMax - xMin;
    double newX = xMin;
    dataTS.add(FlSpot(xMin, yMin));
    double divisionValue = yMax / yMin;

    if (xMin == xMax) {
      dataTS.add(FlSpot(xMax, yMax));
    } else if (yMin == yMax) {
      dataTS.add(FlSpot(xMax, yMax));
    } else {
      b = pow(divisionValue, 1 / sqrt);
      a = yMin / pow(b, xMin);

      for (int i = 0; i < xSeparatorItem; i++) {
        newX += xSeparatorValue;
        y = a * pow(b, newX);
        dataTS.add(FlSpot(newX, y));
      }
    }
    return y;
  }

  double lnCalc(double value) {
    double lnValue;
    return lnValue = log(value) / log(e);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SizedBox(
        width: 450,
        child: Column(
          children: <Widget>[
            Container(
              // height: 600.0,
              width: 350.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Overall compressor pressure ratio 𝜋_𝑎𝑙𝑙',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        compressorPressureRatio = double.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: "Add value ${index + 1}",
                      ),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  Text(
                    'Ambient pressure p',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        ambientPressureP1 = double.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: "Add value ${index + 1}",
                      ),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    'Maximum cycle temperature 𝑇_𝑚𝑎𝑥',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        cycleTemperature3 = double.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: "Add value ${index + 1}",
                      ),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    'Ambient temperature 𝑇',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        ambientTemperatureT1 = double.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: "Add value ${index + 1}",
                      ),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    'Specific heat ratio 𝛾',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        heatRatio = double.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: "Add value ${index + 1}",
                      ),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    'Specific gas constant of air 𝑅_𝑖',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        gasConstantOfAir = double.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: "Add value ${index + 1}",
                      ),
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: 150.0,
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
                            dataPV.clear();
                            dataTS.clear();
                            setState(() {
                              turbinePressureRatio =
                                  1 / compressorPressureRatio;
                              p2 = compressorPressureRatio * ambientPressureP1;
                              p3 = p2;
                              pT = 1 / compressorPressureRatio;
                              p4 = pT * p3;
                              isVisible = true;
                              calculatedHeatRatio = (heatRatio - 1) / heatRatio;
                              pressureDev1 = p2 / ambientPressureP1;
                              pressureDev2 = p4 / p3;
                              t2 = ambientTemperatureT1 *
                                  pow(pressureDev1, calculatedHeatRatio);
                              t4 = cycleTemperature3 *
                                  pow(pressureDev2, calculatedHeatRatio);

                              v1 = (gasConstantOfAir * ambientTemperatureT1) /
                                  ambientPressureP1;
                              v2 = (gasConstantOfAir * t2) / p2;
                              v3 = (gasConstantOfAir * cycleTemperature3) / p3;
                              v4 = (gasConstantOfAir * t4) / p4;
                              divisionT1T4 = ambientTemperatureT1 / t4;
                              divisionT3T2 = cycleTemperature3 / t2;
                              s1 = cp * (lnCalc(divisionT1T4));
                              s3 = cp * (lnCalc(divisionT3T2));
                              s2 = s1;
                              s4 = s3;
                              maxValue.add(ambientPressureP1);
                              maxValue.add(p2);
                              maxValue.add(p3);
                              maxValue.add(p4);
                              maxValue.sort();
                              maxP = maxValue.last * 1.1;
                              maxValue.clear();
                              maxValue.add(v1);
                              maxValue.add(v2);
                              maxValue.add(v3);
                              maxValue.add(v4);
                              maxValue.sort();
                              maxV = maxValue.last * 1.1;
                              maxValue.clear();

                              maxValue.add(ambientTemperatureT1);
                              maxValue.add(t2);
                              maxValue.add(cycleTemperature3);
                              maxValue.add(t4);
                              maxValue.sort();
                              maxT = maxValue.last * 1.1;
                              maxValue.clear();
                              maxValue.add(s1);
                              maxValue.add(s2);
                              maxValue.add(s3);
                              maxValue.add(s4);
                              maxValue.sort();
                              maxS = maxValue.last * 1.1;
                              minS = maxValue.first * 1.1;
                              maxValue.clear();

                              calculationPV(v1, ambientPressureP1, v2, p2);
                              calculationPV(v2, p2, v3, p3);
                              calculationPV(v3, p3, v4, p4);
                              calculationPV(v4, p4, v1, ambientPressureP1);

                              calculationTS(s1, ambientTemperatureT1, s2, t2);
                              calculationTS(s2, t2, s3, cycleTemperature3);
                              calculationTS(s3, cycleTemperature3, s4, t4);
                              calculationTS(s4, t4, s1, ambientTemperatureT1);
                              newV1 = v1.toStringAsFixed(2);
                              newV2 = v2.toStringAsFixed(2);
                              newV3 = v3.toStringAsFixed(2);
                              newV4 = v4.toStringAsFixed(2);

                              newT1 = ambientTemperatureT1.toStringAsFixed(2);
                              newT2 = t2.toStringAsFixed(2);
                              newT3 = cycleTemperature3.toStringAsFixed(2);
                              newT4 = t4.toStringAsFixed(2);
                              newS1 = s1.toStringAsFixed(2);
                              newS2 = s2.toStringAsFixed(2);
                              newS3 = s3.toStringAsFixed(2);
                              newS4 = s4.toStringAsFixed(2);

                              print(
                                  'T1 = $ambientTemperatureT1, T2 = $t2, T3 = $cycleTemperature3, T4 = $t4,');
                              print(
                                  'P1 = $ambientPressureP1, P2 = $p2, P3 = $p3, P4 = $p4,');

                              print(
                                  'T1 = $ambientTemperatureT1, T2 = $t2, T3 = $cycleTemperature3, T4 = $t4,');
                              print('S1 = $s1, S2 = $s2, S3 = $s3, S4 = $s4,');
                            });
                          },
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Visibility(
              visible: isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: LineChart(
                      LineChartData(
                        titlesData: FlTitlesData(
                          topTitles: SideTitles(
                            showTitles: false,
                          ),
                          rightTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        axisTitleData: FlAxisTitleData(
                          topTitle: AxisTitle(
                            showTitle: true,
                            titleText: 'P-V Diagram',
                            reservedSize: 0,
                            textAlign: TextAlign.left,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          leftTitle: AxisTitle(
                            showTitle: true,
                            titleText: 'p',
                            reservedSize: 0,
                            margin: -10,
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                          bottomTitle: AxisTitle(
                            showTitle: true,
                            titleText: 'v',
                            margin: 10,
                            textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        minY: 0,
                        maxY: maxP,
                        minX: 0,
                        maxX: maxV,
                        lineBarsData: [
                          LineChartBarData(
                            colors: [
                              Colors.black,
                            ],
                            spots: dataPV,
                            dotData: FlDotData(
                              show: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: 370,
                    height: 400,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 300,
                    child: Table(
                      //defaultColumnWidth: FixedColumnWidth(100.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow(
                          children: [
                            Text(
                              "P1",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$ambientPressureP1",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "V1",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newV1",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "P2",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$p2",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "V2",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newV2",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "P3",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$p3",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "V3",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newV3",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "P4",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$p4",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "V4",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newV4",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    child: LineChart(
                      LineChartData(
                        titlesData: FlTitlesData(
                          topTitles: SideTitles(
                            showTitles: false,
                          ),
                          rightTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        axisTitleData: FlAxisTitleData(
                          topTitle: AxisTitle(
                            showTitle: true,
                            titleText: 'T-S Diagram',
                            reservedSize: 0,
                            textAlign: TextAlign.left,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          leftTitle: AxisTitle(
                            showTitle: true,
                            titleText: 't',
                            reservedSize: 0,
                            margin: -10,
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                          bottomTitle: AxisTitle(
                            showTitle: true,
                            titleText: 's',
                            margin: 10,
                            textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        minY: 0,
                        maxY: maxT,
                        minX: minS,
                        maxX: maxS,
                        lineBarsData: [
                          LineChartBarData(
                            colors: [
                              Colors.black,
                            ],
                            spots: dataTS,
                            dotData: FlDotData(
                              show: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    width: 370,
                    height: 400,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: Table(
                      //defaultColumnWidth: FixedColumnWidth(100.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow(
                          children: [
                            Text(
                              "T1",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newT1",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "S1",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newS1",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "T2",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newT2",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "S2",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newS2",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "T3",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newT3",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "S3",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newS3",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "T4",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newT4",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "S4",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text(
                              "$newS4",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
