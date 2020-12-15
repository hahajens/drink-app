import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:AlkoApp/model/AlkoObject.dart';

/*
https://api-portal.systembolaget.se/docs/services/Site/operations/5cd7c7d6ed1c2b121ce45b8f?
Använda systemets API för att kolla om ingredienserna finns
och visa närmaste system <-- kanske annat api?
*/

class DB {
  static const urlRecent =
      //"https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";
      "https://www.thecocktaildb.com/api/json/v2/9973533/popular.php";

  static getData() async {
    List<AlkoObject> list;

    http.Response response = await http.get(urlRecent);

    if (response.statusCode == 200) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      //print(list);
      return list;
    } else {
      print("DETTA ÄR NIKLAS FEL");
      print("fan med: ${response.statusCode}");
    }
  }

//TODO när en kombo av ingredienser inte finns kastar den
//Kolla catcher
  static getDataByIngredient(List input) async {
    List<AlkoObject> list;

    String queryURL =
        "https://www.thecocktaildb.com/api/json/v2/9973533/filter.php?i=";

    http.Response response = await http.get(queryURL + input.join(","));
    //print(queryURL + input.join(","));

    if (response.statusCode == 200) {
      try {
        list = (json.decode(response.body)["drinks"] as List)
            .map((data) => AlkoObject.fromJson(data))
            .toList();
      } catch (e) {
        print(
            "ERROR: kombon av ingredienser finns inter.  getdatabyingredient(): $e");
      }

      //print(list);
      return list;
    } else {
      print("DETTA ÄR NIKLAS FEL");
      print("fan med: ${response.statusCode}");
    }
  }

  static getIngredientsList() async {
    List list;
    List<String> returnList = new List();

    String queryURL =
        "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list";

    http.Response response = await http.get(queryURL);

    if (response.statusCode == 200) {
      list = (json.decode(response.body)["drinks"] as List)
          .map((data) => AlkoObject.fromJson(data))
          .toList();

      for (int i = 0; i < list.length; i++) {
        //print(list[i].strIngredient1);
        returnList.add(list[i].strIngredient1);
      }
      //print(returnList);
      return returnList;
    } else {
      print("DETTA ÄR NIKLAS FEL");
      print("fan med: ${response.statusCode}");
    }
  }
}
