import 'package:AlkoApp/views/AgeView.dart';
import 'package:AlkoApp/views/DrinkView.dart';
import 'package:AlkoApp/views/FavoritesView.dart';
import 'package:AlkoApp/views/FilterView.dart';
import 'package:AlkoApp/views/StartView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/Model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Model(), builder: (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       /*theme: ThemeData(
           primaryColor: Colors.blueGrey[200],
           accentColor: Colors.white,
           buttonColor: Colors.blueGrey[200],
           textTheme: TextTheme(headline1: ) ,
           ),*/

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AgeView(),
        '/StartView': (context) => StartView(),
        '/DrinkView': (context) => DrinkView(),
        '/FavoritesView': (context) => FavoritesView(),
        '/FilterView': (context) => FilterView(),
      },
    );
  }
}
