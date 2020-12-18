import 'package:flutter/material.dart';
import 'package:AlkoApp/model/NavigationBar.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 100),
          height: 50.0,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide.none),
            onPressed: () {},
            padding: EdgeInsets.all(10.0),
            color: Color.fromRGBO(0, 160, 227, 1),
            textColor: Colors.white,
            child: Text("Surprise me!", style: TextStyle(fontSize: 25)),
          ),
        ),
        Container(
            child: Column(
          children: [],
        ))
      ]),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
