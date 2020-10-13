import 'package:http/http.dart';
import 'dart:convert';

class DrinksApiProvider {
  Client client = Client();
  static String credentials = '1';
  String baseURL = 'https://www.thecocktaildb.com/api/json/v2/$credentials';

  Future<List<Map<String, dynamic>>> fetchPopularDrinks() async {
    final filter = 'popular.php';
    final response = await client.get('$baseURL/$filter');
    final popular = json.decode(response.body);

    return popular['drinks'].cast<Map<String, dynamic>>();
  }

  Future<List<Map<String, dynamic>>> fetchIngridients() async {
    final filter = 'list.php?i=list';
    final response = await client.get('$baseURL/$filter');
    final ingredients = json.decode(response.body);

    return ingredients['drinks'].cast<Map<String, dynamic>>();
  }

  Future<List<Map<String, dynamic>>> fetchDrinksByIngredient(ingredient) async {
    final filter = 'filter.php?i=$ingredient';
    final response = await client.get('$baseURL/$filter');
    final drinks = json.decode(response.body);

    // Casting type to be return
    return drinks['drinks'].cast<Map<String, dynamic>>();
  }

}