import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';
import 'package:AlkoApp/model/NavigationBar.dart';




class DrinkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AlkoObject drink = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white70,
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Image(
                  image: NetworkImage(drink.strDrinkThumb
                      //bild finns i strDrinkThumb
                      ),
                ),
                Row(
                  children: [
                    _tagWidget(//strTags
                        drink.strTags),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    _titleWidget(//strDrink
                        drink.strDrink),
                    IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      iconSize: 34,
                      onPressed: () {
                        Provider.of<Model>(context, listen: false)
                            .addFavorite(drink);
                        Navigator.pushNamed(context, '/MyFavoritesView'); //ta bort navigator när alla routes funkar
                        //fixa så att man inte kan lägga till 2 av samma, if sats
                        //ska kunna ta bort favoriter
                        //se värde på knapp
                      },
                    )
                  ],
                ),
                _categoryWidget(//strCategory
                    drink.strCategory),
                _alcoholWidget(//strAlcoholic
                    drink.strAlcoholic),
                _glassWidget(//strGlass
                    drink.strGlass),
                _customDivider(),
                _ingredientsWidget(
                    ingredient1: "4cl of Tequila",
                    ingredient2: "2cl of Triple sec",
                    ingredient3: "4cl of Lime juice",
                    ingredient4: "Salt"),
                _customDivider(),
                _instructionWidget(//strInstructions
                    drink.strInstructions),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

Widget _ingredientsWidget({
  String ingredient1,
  String ingredient2,
  String ingredient3,
  String ingredient4,
  String ingredient5,
}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          "Ingredients",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 10),
        child: Text(
          ingredient1,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 5),
        child: Text(
          ingredient2,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 5),
        child: Text(
          ingredient3,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 5),
        child: Text(
          ingredient4,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );
}

Widget _customDivider() {
  return Divider(
    height: 25,
    thickness: 1,
    indent: 15,
    endIndent: 15,
    color: Colors.grey[600],
  );
}

Widget _glassWidget(String glass) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 15),
        child: Text(
          "Serve in",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Container(
          alignment: Alignment.topLeft,
          child: Text(
            glass,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w700,
            ),
          ))
    ],
  );
}

Widget _alcoholWidget(String alcohol) {
  return Container(
    alignment: Alignment.topLeft,
    padding: EdgeInsets.only(top: 15),
    child: Text(
      alcohol,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget _categoryWidget(String category) {
  return Container(
    alignment: Alignment.topLeft,
    padding: EdgeInsets.only(top: 15),
    child: Text(
      category,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget _instructionWidget(String instruction) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          "Instructions",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          instruction,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    ],
  );
}

Widget _titleWidget(String title) {
  return Expanded(
    child: Container(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _tagWidget(String tag) {
  if (tag == null) {
    return Text("", style: TextStyle(fontSize: 32));
  } else {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.only(left: 15, bottom: 20, top: 20),
      padding: EdgeInsets.all(4),
      // TAGGAR, finns i strTags.
      child: Text(tag,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          )),
    );
  }
}
