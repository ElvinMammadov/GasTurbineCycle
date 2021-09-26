import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

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
  double turbinePressureRatio ;
  double p2;
  double p3 ;
  double p4 ;
  double pT;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // print('height is $screenHeight');
    // print('width is $screenWidth');
    TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text('Gas Turbine Cycle'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: 500,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
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
                    child: RaisedButton(
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
                  DropdownButton<int>(
                    value: dropdownValue,
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
                    onChanged: (int newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        //print('value is $dropdownValue');
                      });
                    },
                    items: <int>[1, 2, 3, 4, 5, 6, 7, 8]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
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
                    child: RaisedButton(
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
                child: Container(
                  height: 200.0,
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
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w300),
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
                              color: Colors.red, fontWeight: FontWeight.w300),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            width: 50.0,
                          ),
                          ButtonTheme(
                            buttonColor: Colors.blue[400],
                            minWidth: 50.0,
                            height: 30.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  turbinePressureRatio =
                                      1 / compressorPressureRatio;
                                  p2 = compressorPressureRatio *
                                      ambientPressureP1;
                                  p3 = p2;
                                  pT = 1 / compressorPressureRatio;
                                  p4 = pT * p3;
                                  isVisible2 = true;
                                  print(
                                      'P1 = $ambientPressureP1, P2 = $p2, P3 = $p3, P4 = $p4,');
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

                      // Container(
                      //   height:
                      //       items == 8 ? screenHeight * 0.5 : screenHeight * 0.3,
                      //   width: screenWidth * 0.9,
                      //   child:
                      //   GridView.count(
                      //     crossAxisCount: 3,
                      //     crossAxisSpacing: 2,
                      //     padding: const EdgeInsets.all(10.0),
                      //     children: List.generate(items, (index) {
                      //       return Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: <Widget>[
                      //           Text(
                      //             'Overall compressor pressure ratio 𝜋_𝑎𝑙𝑙',
                      //             style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 17,
                      //             ),
                      //           ),
                      //           TextField(
                      //             decoration: InputDecoration(
                      //               hintText: "Add value ${index + 1}",
                      //             ),
                      //             style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 15,
                      //             ),
                      //           ),
                      //         ],
                      //       );
                      //     }),
                      //   ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isVisible2,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: SizedBox(
                  child: Echarts(
                    // extraScript: '''
                    // var data = [
                    // [10, ambientPressureP1],
                    // [5,  p2],
                    // [30, p3],
                    // [45, p4],
                    // [10, ambientPressureP1]]
                    // ''',
                    option: '''
                    {
                      xAxis: {
                        name: 'v',
                        type: 'value'
                        
                    
                        },
                      yAxis: {
                       name: 'p',
                         type: 'value',
                         offset: '1'
                        },
                      series: [{
                        data: [
                    [10,$ambientPressureP1],
                    [5,  $p2],
                    [30, $p3],
                    [40, $p4],
                    [10, $ambientPressureP1]],
                      type: 'line',
                       smooth: false,
                       stack: 'total'
                      }]
                    }
                  ''',
                  ),
                  width: 400,
                  height: 300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
