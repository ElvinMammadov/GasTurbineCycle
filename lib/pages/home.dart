import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int dropdownValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text('Gas Turbine Cycle'),
        centerTitle: true,
      ),
      body: Container(
        //height: 500,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "How many values has to be added ?",
              style: TextStyle(fontSize: 20),
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
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 20),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (int newValue) {
                    setState(() {
                      dropdownValue = newValue;
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
                  minWidth: 60.0,
                  height: 40.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: RaisedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/values');
                    },
                    child: Text(
                      'Choose',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 400.0,
              width: 350.0,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                padding: const EdgeInsets.all(15.0),
                children: List.generate(4, (index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Item ${index+1}',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Add value ${index+1}",
                          ),
                        ),
                      ]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
