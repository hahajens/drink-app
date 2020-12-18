import 'dart:convert';
import 'package:AlkoApp/model/IngredientObject.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:http/http.dart' as http;

import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:provider/provider.dart';

class DB {
  static const url = "https://www.thecocktaildb.com/api/json/v2/9973533";

  static getData() async {
    List<AlkoObject> list;

    String queryURL = "/popular.php";

    http.Response response = await http.get(url + queryURL);

    if (response.statusCode == 200) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      //print(list);
      return list;
    } else {
      print("ERROR Fel i getData() ERROR: ${response.statusCode}");
    }
  }

//TODO gör en snyggare lösning
  static getDataByIngredient(List input, context) async {
    List<AlkoObject> list;

    String queryURL = "/filter.php?i=";

    http.Response response = await http.get(url + queryURL + input.join(","));

    //Om det inte skickas in en lista alt APIet går ner fångar den det och returnerar sparad lista ifrån model
    if (response.statusCode == 200 &&
        json.decode(response.body).toString().length > 23) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      //print(list);
      return list;
    } else {
      //print("ERROR Fel i getDataByIngredient() ERROR: ${response.statusCode}");
      Provider.of<Model>(context, listen: false).myFlutterToast(
          "Oj den mixen av ingredienser hittade vi inte i någon drink.");
      return Provider.of<Model>(context, listen: false).alkoList;
    }
  }

  static getIngredientsList() async {
    List list;
    List<IngredientObject> returnList = new List();

    String queryURL =
        "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list";

    http.Response response = await http.get(queryURL);

    if (response.statusCode == 200) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      for (int i = 0; i < list.length; i++) {
        //print(list[i].strIngredient1);
        returnList
            .add(IngredientObject(strIngredient1: list[i].strIngredient1));
      }
      //print(returnList);
      return returnList;
    } else {
      print("ERROR Fel i getIngredientList() ERROR: ${response.statusCode}");
    }
  }

  static getPopularDrinks() async {
    List<AlkoObject> list;

    String queryURL = '/popular.php';

    http.Response response = await http.get(url + queryURL);

    if (response.statusCode == 200) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      return list;
    } else {
      print("Struuuul med att hämta populära");
    }
  }

  static getRandomDrink() async {
    List<AlkoObject> list;

    String queryURL = 'https://www.thecocktaildb.com/api/json/v1/1/random.php';

    http.Response response = await http.get(queryURL);

    if (response.statusCode == 200) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      return list;
    } else {
      print("Struuuul med att hämta random");
    }
  }
}
