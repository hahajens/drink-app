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
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  Image(image: NetworkImage(drink.strDrinkThumb)),
                  Row(
                    children: [
                      _tagWidget(drink.strTags),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    _titleWidget(drink.strDrink),
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
                _categoryWidget(drink.strCategory),
                _alcoholWidget(drink.strAlcoholic),
                _glassWidget(drink.strGlass),
                _customDivider(),
                _ingredientsWidget(
                  measure1: drink.strMeasure1,
                  ingredient1: drink.strIngredient1,
                  measure2: drink.strMeasure2,
                  ingredient2: drink.strIngredient2,
                  measure3: drink.strMeasure3,
                  ingredient3: drink.strIngredient3,
                  measure4: drink.strMeasure4,
                  ingredient4: drink.strIngredient4,
                  measure5: drink.strMeasure5,
                  ingredient5: drink.strIngredient5,
                  measure6: drink.strMeasure6,
                  ingredient6: drink.strIngredient6,
                  measure7: drink.strMeasure7,
                  ingredient7: drink.strIngredient7,
                ),
                _customDivider(),
                _instructionWidget(drink.strInstructions),
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
  String measure1,
  String ingredient1,
  String measure2,
  String ingredient2,
  String measure3,
  String ingredient3,
  String measure4,
  String ingredient4,
  String measure5,
  String ingredient5,
  String measure6,
  String ingredient6,
  String measure7,
  String ingredient7,
}) {
  Map<String, String> parameterList = {};
  if (measure1 == "" || ingredient1 == "") {
    print("null");
  } else {
    parameterList[measure1] = ingredient1;
  }
  if (measure2 == "" || ingredient2 == "") {
    print("null");
  } else {
    parameterList[measure2] = ingredient2;
  }
  if (measure3 == "" || ingredient3 == "") {
    print("null");
  } else {
    parameterList[measure3] = ingredient3;
  }
  if (measure4 == "" || ingredient4 == "") {
    print("null");
  } else {
    parameterList[measure4] = ingredient4;
  }
  if (measure5 == "" || ingredient5 == "") {
    print("null");
  } else {
    parameterList[measure5] = ingredient5;
  }
  if (measure6 == "" || ingredient6 == "") {
    print("null");
  } else {
    parameterList[measure6] = ingredient6;
  }
  if (measure7 == "" || ingredient7 == "") {
    print("null");
  } else {
    parameterList[measure7] = ingredient7;
  }

  return Column(children: [
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
    for (var s in parameterList.keys)
      Container(
          alignment: Alignment.topLeft,
          child: ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: 0),
            title: Text(
              "${parameterList[s]}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3),
            ),
            subtitle: Text(
              "$s",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ))
  ]);
}

Widget _customDivider() {
  return Divider(
    height: 25,
    thickness: 1,
    indent: 10,
    endIndent: 10,
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
  print(title);
  return Expanded(
    child: Container(
      padding: EdgeInsets.only(top: 10),
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
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      padding: EdgeInsets.all(5),
      // TAGGAR, finns i strTags.
      child: Text(tag,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          )),
    );
  }
}
