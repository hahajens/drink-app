import 'package:AlkoApp/model/FavoriteModel.dart';
import 'package:AlkoApp/views/AgeView.dart';
import 'package:AlkoApp/views/DrinkView.dart';
import 'package:AlkoApp/views/FavoritesView.dart';
import 'package:AlkoApp/views/FilterView.dart';
import 'package:AlkoApp/views/StartView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/FilterModel.dart';
import 'model/Model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Model>(create: (_) => Model()),
      ChangeNotifierProvider<FilterModel>(create: (_) => FilterModel()),
      ChangeNotifierProvider<FavoriteModel>(create: (_) => FavoriteModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
