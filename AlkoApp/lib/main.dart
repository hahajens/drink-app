import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:AlkoApp/views/ObjectInfoView.dart';
import 'package:AlkoApp/views/MyHomeListview.dart';
import 'package:AlkoApp/model/Model.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomeListview(),
        '/ObjectInfoview': (context) => ObjectInfoview(),
      },
    );
  }
}
