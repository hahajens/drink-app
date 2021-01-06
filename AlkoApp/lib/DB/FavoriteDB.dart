import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:AlkoApp/model/AlkoObject.dart';

class FavoriteDB {
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
      print("ERROR: getFavoriteListData() ERROR: ${response.statusCode}");
    }
  }

  static removeFromFavoriteListData(int idDrink) async {
    String queryURL =
        'https://secret-springs-79454.herokuapp.com/removeObject?idDrink=$idDrink';

    http.Response response = await http.put(queryURL);

    if (response.statusCode == 200) {
    } else {
      print("ERROR: getFavoriteListData() ERROR: ${response.statusCode}");
    }
  }

  static addToFavoriteListData(drink) async {
    String queryURL =
        'https://secret-springs-79454.herokuapp.com/addObject?strDrink=${drink.strDrink}&strDrinkThumb=${drink.strDrinkThumb}&idDrink=${drink.idDrink}';

    http.Response response = await http.put(queryURL);

    if (response.statusCode == 200) {
    } else {
      print("ERROR: getFavoriteListData() ERROR: ${response.statusCode}");
    }
  }
}
