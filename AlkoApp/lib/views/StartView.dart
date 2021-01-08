import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/widgets/NavigationBar.dart';
import 'package:AlkoApp/widgets/DrinkCarousel.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: ListView(
          children: [
            DrinkCarousel(
                title: 'Popular Drinks',
                list: Provider.of<Model>(context, listen: false).popularList),
            DrinkCarousel(
                title: 'Latest Drinks',
                list: Provider.of<Model>(context, listen: false).latestList),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
