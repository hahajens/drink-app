import 'dart:io';
import 'package:AlkoApp/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bar2.jfif'), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Colors
                        .transparent), //color is transparent so that it does not blend with the actual color specified
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                color: Color.fromRGBO(0, 0, 0,
                    0.5) // Specifies the background color and the opacity
                ),
            child: Text("AlkoList \n - Listan med alkohol",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.8,
              //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Color.fromRGBO(186, 186, 186, 0.75)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Text(
                      "This app contains alcoholic content and you need to be over 20 years to access it.",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  RaisedButton(
                    elevation: 10,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/StartView');
                    },
                    textColor: Colors.black,
                    child: Text('I am at least 20 years old',
                        style: TextStyle(fontSize: 16)),
                    color: Colors.white,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  RaisedButton(
                    elevation: 10,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    onPressed: () {
                      Provider.of<Model>(context, listen: false).myFlutterToast(
                          "You need to be at least 20 years old to use this app, try again ;)");
                    },
                    textColor: Colors.black,
                    child: Text('I am younger than 20 years old',
                        style: TextStyle(fontSize: 16)),
                    color: Colors.white,
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
