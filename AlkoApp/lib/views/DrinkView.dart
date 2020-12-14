import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrinkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AlkoObject obj = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white60,
      body: ListView(
        children: [
          Container(
            //padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: NetworkImage(
                        //bild finns i strDrinkThumb
                        "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80"),
                  ),
                ),
                Row(
                  children: [
                    _tagWidget(//strTags
                        "Strong Flavour"),
                    _tagWidget("Morning Drink"),
                    _tagWidget("Hangover"),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              _titleWidget(//strDrink
                  obj.strDrink),
              IconButton(
                icon: Icon(Icons.favorite_border_outlined),
                iconSize: 34,
                onPressed: () {
                  // Lägg till i favoritlista
                },
              )
            ],
          ),
          _categoryWidget(//strCategory
              "Cocktail"),
          _alcoholWidget(//strAlcoholic
              "Alcoholic"),
          _glassWidget(//strGlass
              "Cocktail Glass"),
          _customDivider(),
          _ingredientsWidget(
              ingredient1: "4cl of Tequila",
              ingredient2: "2cl of Triple sec",
              ingredient3: "4cl of Lime juice",
              ingredient4: "Salt"),
          _customDivider(),
          _instructionWidget(//strInstructions
              "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass."),
        ],
      ),
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
        padding: EdgeInsets.only(left: 15),
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
        padding: EdgeInsets.only(left: 15, top: 10),
        child: Text(
          ingredient1,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 15, top: 5),
        child: Text(
          ingredient2,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 15, top: 5),
        child: Text(
          ingredient3,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 15, top: 5),
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
        padding: EdgeInsets.only(left: 15, top: 15),
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
          padding: EdgeInsets.only(left: 15),
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
    padding: EdgeInsets.only(left: 15, top: 15),
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
    padding: EdgeInsets.only(left: 15, top: 15),
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
        padding: EdgeInsets.only(left: 15),
        child: Text(
          "Instructions",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
  return Container(
    padding: EdgeInsets.only(left: 15),
    alignment: Alignment.topLeft,
    child: Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _tagWidget(String tag) {
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
