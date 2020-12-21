import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/widgets/LatestDrinksCarousel.dart';
import 'package:AlkoApp/widgets/PopularDrinkCarousel.dart';
import 'package:AlkoApp/widgets/PopularIngredientsCarousel.dart';
import 'package:flutter/material.dart';
import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:provider/provider.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        body: ListView(
          children: [
            Container(
            height: 100,
            width: 500,
            child: Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: _supriseButton(context, state),
            ),
            ),
            
            PopularDrinkCarousel(),
            LatestDrinksCarousel(),
            
            //PopularIngredientsCarousel(),
            //Expanded(child: _popularListview(state.popularList)),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Widget _supriseButton(BuildContext context, state) {
    return RaisedButton(
        color: Colors.pinkAccent,
        onPressed: () {
          state.randomDrink();
          Navigator.pushNamed(context, '/DrinkView',
              arguments: state.randomList[0]); // lägg till .drinkId
        },
        child: Text("Suprise Me!"));
  }

  /*Widget _popularListview(list) {
    return Consumer<Model>(
        builder: (context, state, child) => ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(list[index].strDrinkThumb),
                  ),
                  title: Text("${list[index].strDrink}"),
                  trailing: Text("${list[index].strAlcoholic}"),
                  onTap: () {
                    Navigator.pushNamed(context, '/DrinkView',
                        arguments: list[index]);
                  });
            }));
  }*/
}
