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
      //Ska rethrowa så att allt hanteras där det bör
      Provider.of<Model>(context, listen: false).myFlutterToast(
          "Oj den mixen av ingredienser hittade vi inte i någon drink.");
      return Provider.of<Model>(context, listen: false).alkoList;
    }
  }

  static getIngredientsList() async {
    List list;

    String queryURL =
        "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list";
    String picURL = "https://www.thecocktaildb.com/images/ingredients";

    http.Response qResponse = await http.get(queryURL);

    if (qResponse.statusCode == 200) {
      list = (json.decode(qResponse.body)["drinks"] as List)
          .map((data) => IngredientObject.fromJson(data))
          .toList();

      for (int i = 0; i < list.length; i++) {
        list[i].setPic(picURL + "/${list[i].getStrIngredient1}.png");
      }
      return list;
    } else {
      print("ERROR Fel i getIngredientList() ERROR: ${qResponse.statusCode}");
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

  static getSingleObjectByID(id) async {
    List<AlkoObject> list;

    String queryURL =
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id';

    http.Response response = await http.get(queryURL);

    if (response.statusCode == 200) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      return list;
    } else {
      print("ERROR Fel i getSingleObjectByID() ERROR: ${response.statusCode}");
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

  static getLatestDrinks() async {
    List<AlkoObject> list;

    String queryURL = '/latest.php';

    http.Response response = await http.get(url + queryURL);

    if (response.statusCode == 200) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      return list;
    } else {
      print("Struuuul med att hämta senaste");
    }
  }
}
