import 'dart:convert';
import 'dart:math';
import 'package:AlkoApp/model/IngredientObject.dart';
import 'package:AlkoApp/model/Model.dart';
import 'package:http/http.dart' as http;

import 'package:AlkoApp/model/AlkoObject.dart';
import 'package:provider/provider.dart';

class DB {
  static const url = "https://www.thecocktaildb.com/api/json/v2/9973533";

  static getData() async {
    List<AlkoObject> list;

    String queryURL =
        "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?s=";

    // String queryURL =
    //     "https://www.thecocktaildb.com/api/json/v2/9973533/popular.php";

    http.Response response = await http.get(queryURL);

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

  static getCocktailsByString(String input, context) async {
    List<AlkoObject> list;

    String queryURL =
        "https://www.thecocktaildb.com/api/json/v2/9973533/search.php?s=$input";

    http.Response response = await http.get(queryURL);

    if (response.statusCode == 200 &&
        json.decode(response.body).toString().length > 23) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      //print(list);
      return list;
    } else {
      //print("ERROR Fel i getData() ERROR: ${response.statusCode}");
      Provider.of<Model>(context, listen: false)
          .myFlutterToast("Didn't find anything with that search:(");
      return [];
    }
  }

//Lös bättre
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

      return list;
    } else {
      input.removeAt(Random().nextInt(input.length));
      if (input.isEmpty) {
        Provider.of<Model>(context, listen: false)
            .myFlutterToast("Vi hittade ingen drink med de ingredienserna :(");
        return Provider.of<Model>(context, listen: false).alkoList;
      }

      http.Response nResponse =
          await http.get(url + queryURL + input.join(","));

      try {
        list = (json.decode(nResponse.body)["drinks"] as List)
            .map((data) => AlkoObject.fromJson(data))
            .toList();
      } catch (e) {
        print("ERROR I getdatabyingredient(): $e");
        Provider.of<Model>(context, listen: false)
            .myFlutterToast("Vi hittade ingen drink med de ingredienserna :(");
        return Provider.of<Model>(context, listen: false).alkoList;
      }

      Provider.of<Model>(context, listen: false).myFlutterToast(
          "Vi hittade ingen drink med de ingredienserna men hitta några med dessa: $input");

      return list;
    }
  }

  static getIngredientsList() async {
    List list;

    String queryURL =
        "https://www.thecocktaildb.com/api/json/v2/9973533/list.php?i=list";
    String picURL = "https://www.thecocktaildb.com/images/ingredients";

    http.Response qResponse = await http.get(queryURL);

    if (qResponse.statusCode == 200) {
      list = (json.decode(qResponse.body)["drinks"] as List)
          .map((data) => IngredientObject.fromJson(data))
          .toList();

      for (int i = 0; i < list.length; i++) {
        list[i].setPic(picURL + "/${list[i].getStrIngredient1}-Small.png");
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

  static Future<String> getIngredientImage(String ingredient) async {
    String queryURL =
        "https://www.thecocktaildb.com/images/ingredients/$ingredient-Small.png";

    http.Response response = await http.get(queryURL);

    if (response.statusCode == 200) {
      return queryURL;
    } else {
      return "https://www.thecocktaildb.com/images/ingredients/vodka-Small.png";
    }
  }

  static getFavoriteListData() async {
    List<AlkoObject> list;

    String queryURL = 'https://secret-springs-79454.herokuapp.com/';

    http.Response response = await http.get(queryURL);

    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      return list;
    } else {
      print("ERROR Fel i getFavoriteListData() ERROR: ${response.statusCode}");
    }
  }

  static removeFromFavoriteListData(int idDrink) async {
    String queryURL =
        'https://secret-springs-79454.herokuapp.com/removeObject?idDrink=$idDrink';

    http.Response response = await http.put(queryURL);

    if (response.statusCode == 200) {
      print("Tog bort drinken med id $idDrink ur apiet bram");
    } else {
      print("ERROR Fel i getFavoriteListData() ERROR: ${response.statusCode}");
    }
  }

  static addToFavoriteListData(drink) async {
    String queryURL =
        'https://secret-springs-79454.herokuapp.com/addObject?strDrink=${drink.strDrink}&strDrinkThumb=${drink.strDrinkThumb}&idDrink=${drink.idDrink}';

    http.Response response = await http.put(queryURL);

    if (response.statusCode == 200) {
      print("La till $drink i apiet bram");
    } else {
      print("ERROR Fel i getFavoriteListData() ERROR: ${response.statusCode}");
    }
  }
}
