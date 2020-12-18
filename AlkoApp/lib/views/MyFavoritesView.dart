import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:provider/provider.dart';

class MyFavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites', textAlign: TextAlign.center,),
        backgroundColor: Colors.black,
      ),
    body: MyFavorites(),
    bottomNavigationBar: CustomNavigationBar(),  
    );
  }
}

class MyFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => ListView.builder(
      itemCount: state.favoriteList.length,
      itemBuilder: (context, index) {
      return ListTile(
        leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(state.favoriteList[index].strDrinkThumb),

              ),
              title: Text("${state.favoriteList[index].strDrink}"),

      );
     },
      )
      
    )
      
    ;
  }
} 