import 'package:AlkoApp/DB/DB.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/model/AlkoObject.dart';

//TODO ändra hur height och width sätts
class MySearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, state, child) => Scaffold(
        appBar: _myHomeAppbar(),
        drawer: _myHomeDrawer(),
        body: Column(
          children: [
            //_mySearchBar(),
            Container(
              height: 50,
              width: 10000,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: _filterButton(context, state)),
            ),
            Expanded(child: _myCustomListview(state.alkoList)),
          ],
        ),
      ),
    );
  }

  Widget _myHomeAppbar() {
    return AppBar(
      title: Text("Söksida/filtrering"),
    );
  }

  Widget _myHomeDrawer() {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("bens"),
            onTap: () {
              //Navigator eller routes
            },
          ),
          ListTile(title: Text("knens")),
          ListTile(title: Text("slens")),
        ],
      ),
    );
  }

  // //TODO
  // //1. fyll en lista med alla spritsorter i model och fyll filtret
  // //3. Hur gör man query för "hela" db? alt hur gör man en query för bara spritstorterna?
  // //4. gör klart filtreringen, flytta listtofilteron till lokalt
  // //5. bestäm vad vi ska kunna sortera med i gruppen
  // //6. VIKTIG kolla om kombo inte finns ska den inte krascha

//skapar en lista med strängar att sortera på
  Widget _filterButton(BuildContext context, state) {
    return FlatButton(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      onPressed: () {
        _filterDialog(context, state);
      },
      child: Text("Filtrera"),
    );
  }

  _filterDialog(BuildContext context, state) async {
    List<String> listOfIngredients = await state.getIngredientsList();
    //List<String> listOfIngredients = ["vodka", "gin"];
    List listToFilterOn = new List();

    Widget okButton = FlatButton(
      child: Text("Filtrera"),
      onPressed: () {
        Navigator.pop(context);
        state.setListByIngredient(listToFilterOn);
      },
    );

    Widget cancelButton = FlatButton(
      child: Text("Rensa filter"),
      onPressed: () {
        Navigator.pop(context);
        listToFilterOn.clear();
        state.setListByIngredient(listToFilterOn);
        print("Tapped: ${listToFilterOn}");
      },
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Filtermeny"),
          content: Container(
            width: MediaQuery.of(context).size.width * .7,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(listOfIngredients.length, (index) {
                return Container(
                  child: GestureDetector(
                    onTap: () {
                      listToFilterOn.add(listOfIngredients[index]);
                      print("Tapped: ${listToFilterOn}");
                    },
                    child: Card(
                      color: Colors.blue,
                      child: Text("${listOfIngredients[index]}"),
                    ),
                  ),
                );
              }),
            ),
          ),
          actions: [
            cancelButton,
            okButton,
          ],
        );
      },
    );
  }

  Widget _myCustomListview(list) {
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
                state.index = index;
                Navigator.pushNamed(context, '/DrinkView',
                    arguments: list[index]);
              });
        },
      ),
    );
  }
}

// Widget _mySearchBar() {
//   TextEditingController controller = new TextEditingController();
//   return Row(
//     children: [
//       Expanded(
//         child: TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.all(8.0),
//             border: InputBorder.none,
//             hintText: 'Sök på Drinknamn:',
//             hintStyle: TextStyle(color: Colors.grey),
//           ),
//         ),
//       ),
//     ],
//   );
// }
