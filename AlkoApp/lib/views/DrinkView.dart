import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:AlkoApp/widgets/Spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:provider/provider.dart';
import 'package:AlkoApp/model/NavigationBar.dart';

class DrinkView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;
//Objektet heter nu drink.data
    return FutureBuilder<AlkoObject>(
      future: _getDrink(context, id),
      builder: (BuildContext context, AsyncSnapshot<AlkoObject> drink) {
        if (drink.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Spinner(),
          );
        } else {
          if (drink.hasError)
            return Center(child: Text('Error: ${drink.error}'));
          else
            return Scaffold(
              backgroundColor: Color(0xFFF4F4F4),
              body: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        // height: 100,
                        // width: 100,

                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Hero(
                          tag: drink.data.strDrinkThumb,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image(
                              image: NetworkImage(drink.data.strDrinkThumb),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              iconSize: 30.0,
                              color: Colors.white,
                              onPressed: () => Navigator.pop(context),
                            ),
                            Consumer<Model>(
                              builder: (context, state, child) => IconButton(
                                icon: state.getFavoriteIcon(drink.data),
                                iconSize: 34,
                                onPressed: () {
                                  state.setFavoriteIcon(drink.data);
                                  state.editFavorite(drink.data);
                                  //ta bort navigator när alla routes funkar
                                  //fixa så att man inte kan lägga till 2 av samma, if sats
                                  //ska kunna ta bort favoriter
                                  //se värde på knapp
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        bottom: 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              drink.data.strDrink,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(4.0, 3.0),
                                    blurRadius: 15.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _categoryWidget(drink.data.strCategory),
                                    _alcoholWidget(drink.data.strAlcoholic),
                                    _glassWidget(drink.data.strGlass),
                                  ],
                                ),
                              ),
                              _ingredientsWidget(
                                drink.data,
                                context,
                                measure1: drink.data.strMeasure1,
                                ingredient1: drink.data.strIngredient1,
                                measure2: drink.data.strMeasure2,
                                ingredient2: drink.data.strIngredient2,
                                measure3: drink.data.strMeasure3,
                                ingredient3: drink.data.strIngredient3,
                                measure4: drink.data.strMeasure4,
                                ingredient4: drink.data.strIngredient4,
                                measure5: drink.data.strMeasure5,
                                ingredient5: drink.data.strIngredient5,
                                measure6: drink.data.strMeasure6,
                                ingredient6: drink.data.strIngredient6,
                                measure7: drink.data.strMeasure7,
                                ingredient7: drink.data.strIngredient7,
                                measure8: drink.data.strMeasure8,
                                ingredient8: drink.data.strIngredient8,
                                measure9: drink.data.strMeasure9,
                                ingredient9: drink.data.strIngredient9,
                              ),
                              _customDivider(),
                              _instructionWidget(drink.data.strInstructions),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              bottomNavigationBar: CustomNavigationBar(),
            );
        }
      },
    );
  }
}

Future<AlkoObject> _getDrink(context, id) async {
  AlkoObject drink =
      await Provider.of<Model>(context, listen: false).getSingleObjectByID(id);

  //print(drink.strIngredient1 + drink.strIngredient2 + drink.strIngredient3 + drink.strIngredient4 + drink.strIngredient5 + drink.strIngredient6);
  print("id");
  print(drink);

  return drink;
}

Widget _ingredientsWidget(
  AlkoObject drink,
  context, {
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
  String measure8,
  String ingredient8,
  String measure9,
  String ingredient9,
}) {
  // Map<String, String> parameterList = {
  //   ingredient1: measure1,
  //   ingredient2: measure2,
  //   ingredient3: measure3,
  //   ingredient4: measure4,
  //   ingredient5: measure5,
  //   ingredient6: measure6,
  //   ingredient7: measure7,
  //   ingredient8: measure8,
  //   ingredient9: measure9,
  // };

  // parameterList.removeWhere((String value, String key) => value == null);
  // parameterList.removeWhere((String value, String key) => value == "");
  // print(parameterList);
  Map<String, String> parameterList =
      Provider.of<Model>(context, listen: false).getIngredientList(drink);

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
    for (var k in parameterList.keys)
      Container(
          alignment: Alignment.topLeft,
          child: ListTile(
            leading: Image(
                image: NetworkImage(
                    "https://www.thecocktaildb.com/images/ingredients/${k}-Small.png")), //Provider.of<Model>(context, listen: false).getIngredientImage(parameterList[s]))),
            visualDensity: VisualDensity(horizontal: 0, vertical: 0),
            title: Text(
              "$k",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3),
            ),
            subtitle: Text(
              "${parameterList[k]}",
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
  return Expanded(
    child: Column(
      children: [
        Container(
          child: Text(
            "Serve in",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          child: Text(
            glass,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _alcoholWidget(String alcohol) {
  return Expanded(
    child: Column(
      children: [
        Container(
          child: Text(
            "Type",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          child: Text(
            alcohol,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _categoryWidget(String category) {
  return Expanded(
    child: Column(
      children: [
        Container(
          child: Text(
            "Category",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          child: Text(
            category,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
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
      padding: EdgeInsets.only(top: 10),
      alignment: Alignment.topLeft,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.bold,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(10.0, 10.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
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
