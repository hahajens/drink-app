import 'package:AlkoApp/model/NavigationBar.dart';
import 'package:AlkoApp/widgets/CreateDrinkContainer.dart';
import 'package:flutter/material.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:provider/provider.dart';

class MyFavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        body: (state.favoriteList.length == 0)
            ? Center(
                child: Text("No saved favorites"),
              )
            : GridView.count(
                padding: EdgeInsets.only(top: 60),
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                children: List.generate(state.favoriteList.length, (index) {
                  return Container(
                    child: Stack(
                      children: [
                        CreateDrinkContainer(state.favoriteList[index]),
                        _deleteButton(state, index)
                      ],
                    ),
                  );
                }),
              ),
      ),
    );
  }

  Widget _deleteButton(state, index) {
    return Positioned(
      right: 15,
      top: 10,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0.0, 2.0), blurRadius: 30.0)
        ]),
        child: IconButton(
          icon: Icon(Icons.highlight_remove, color: Colors.white, size: 40.0),
          onPressed: () {
            state.removeFavorite(state.favoriteList[index]);
          },
        ),
      ),
    );
  }
}

// class MyFavoritesView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Model>(
//       builder: (context, state, child) => Scaffold(
//         body: _myFavorites(state, context, state.favoriteList),
//         bottomNavigationBar: CustomNavigationBar(),
//       ),
//     );
//   }

//   Widget _myFavorites(state, context, favoriteList) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: GridView.count(
//         crossAxisCount: 2,
//         children: List.generate(
//             favoriteList.length,
//             (index) => Stack(children: <Widget>[
//                   GestureDetector(
//                     onTap: () {
//                 Navigator.pushNamed(context, '/DrinkView',
//                         arguments: favoriteList[index].idDrink);                    },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20.0),
//                         child: Image(
//                           image: NetworkImage(
//                               Provider.of<Model>(context, listen: false)
//                                   .favoriteList[index]
//                                   .strDrinkThumb),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 10,
//                     right: 10,
//                     child: Container(
//                     decoration: BoxDecoration(
//                     boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0.0, 2.0),
//                       blurRadius: 40.0,
//                 ),
//                ],
//               ),
//                       child: IconButton(
//                         icon: Icon(Icons.delete, color: Colors.white, size: 30.0),
//                         onPressed: () {
//                           state.removeFavorite(state.favoriteList[index]);
//                         },
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Text(
//                       "${favoriteList[index].strDrink}",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 35.0,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 1.2,
//                         shadows: <Shadow>[
//                           Shadow(
//                             offset: Offset(4.0, 3.0),
//                             blurRadius: 15.0,
//                             color: Color.fromARGB(255, 0, 0, 0),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ])),
//       ),
//     );

//   }
// }
