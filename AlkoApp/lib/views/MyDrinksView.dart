import 'package:AlkoApp/widgets/PopularDrinkCarousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrinksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F4F4),
        body: ListView(
          children: [
            PopularDrinkCarousel(),
            // PopularIngredientsCarousel(),
            // RandomDrinksCarousel()
          ],
        ),
      ),
    );
  }
}
// class MyDrinksView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'My recepies',
//           style: TextStyle(fontFamily: "Tomorrow"),
//         ),
//       ),
//       body: MyDrinksList(),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         label: Text('Add new Drink'),
//         icon: Icon(Icons.add),
//       ),
//       /*bottomNavigationBar: BottomNavigationBar(
//           currentIndex: 0,
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               title: Text('Home'),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.search),
//               title: Text('Search'),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               title: Text('Favorites'),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.local_drink),
//               title: Text('My Drinks'),
//             ),
//           ]),*/
//           bottomNavigationBar: CustomNavigationBar()
//     );
//   }
// }

// class MyDrinksList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Model>(
//       builder: (context, state, child) => ListView.builder(
//         itemCount: state.alkoList.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//               leading: CircleAvatar(
//                 backgroundImage:
//                     NetworkImage(state.alkoList[index].strDrinkThumb),
//               ),
//               title: Text("${state.alkoList[index].strDrink}"),
//               trailing: Text("${state.alkoList[index].strAlcoholic}"),
//               onTap: () {});
//         },
//       ),
//     );
//   }
// }
