import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:provider/provider.dart';

class MyFavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favorites',
          textAlign: TextAlign.center,
        ),
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
                      NetworkImage(state.alkoList[index].strDrinkThumb),
                ),
                title: Text("${state.favoriteList[index].strDrink}"),
                trailing: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.black),
                  onPressed: () {
                        state.removeFavorite(state.favoriteList[index]);
                        state.myFlutterToast('Removed drink from favorites');
                  },
                ),
              );
            }));
  }
}

// List<Model> _favoriteList(favoriteList, setFavorite) {
//   if (setFavorite == Icon(Icons.favorite)) return favoriteList;
//   if (setFavorite == Icon(Icons.favorite_border_outlined))
//     return (favoriteList.where(
//         (drink) => drink.isFavorite == Icon(Icons.favorite_border_outlined)));
// }
