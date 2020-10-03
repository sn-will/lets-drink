import 'package:http/http.dart';
import 'dart:convert';

class DrinksApiProvider {
  Client client = Client();
  static String credentials = '1';
  String baseURL = 'https://www.thecocktaildb.com/api/json/v1/$credentials';

  fetchPopularDrinks() {

  }

  fetchIngridients() {

  }

  Future<List<Map<String, dynamic>>> fetchDrinkByIngredient(ingredient) async {
    final filter = 'filter.php?i=$ingredient';
    final response = await client.get('$baseURL/$filter');
    final drinks = json.decode(response.body);

    // Casting type to be return
    return drinks['drinks'].cast<Map<String, dynamic>>();
  }

}