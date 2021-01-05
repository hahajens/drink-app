import 'package:flutter/material.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:provider/provider.dart';

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
                  onPressed: () {
                    Navigator.pushNamed(context, '/StartView');
                  },
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
                  onPressed: () {
                    Provider.of<Model>(context, listen: false)
                        .myFlutterToast('Sorry, to young...');
                  },
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
