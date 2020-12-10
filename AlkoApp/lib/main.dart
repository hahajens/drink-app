import 'package:AlkoApp/views/AgeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AlkoApp/views/MyDrinksView.dart';

import 'package:AlkoApp/views/MyHomeListview.dart';
import 'package:AlkoApp/model/Model.dart';

//TODO Använd routes istället för navigator
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Model(), builder: (context, child) => MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(     
      debugShowCheckedModeBanner: false,
      home: AgeView(),

    );
  }
}
