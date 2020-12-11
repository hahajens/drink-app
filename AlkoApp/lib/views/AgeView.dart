import 'package:flutter/material.dart';

class AgeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bar2.jfif'), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Drink App',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  textColor: Colors.black,
                  child: Text('Jag har fyllt 20år'),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  textColor: Colors.black,
                  child: Text('Jag är under 20år'),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
