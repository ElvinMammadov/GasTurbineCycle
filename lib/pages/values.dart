import 'package:flutter/material.dart';

class Values extends StatefulWidget {
  @override
  _ValuesState createState() => _ValuesState();
}

class _ValuesState extends State<Values> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text('Gas Turbine Cycle'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonTheme(
              buttonColor: Colors.blue[400],
              minWidth: 200.0,
              height: 60.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/values');
                },
                child: Text(
                  'Choose values',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}