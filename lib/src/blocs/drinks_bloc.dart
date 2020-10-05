import '../resources/drinks_api_provider.dart';
import 'package:rxdart/rxdart.dart';

class DrinksBloc {
  final api = DrinksApiProvider();
  final _drinksController = PublishSubject<List<Map<String, dynamic>>>();
  final _ingredientsContriller = PublishSubject<List<Map<String, dynamic>>>();

  // Drinks getter
  Stream get drinks => _drinksController.stream;
  Stream get ingredients => _ingredientsContriller.stream;

  fetchDrinksByIngredient(ingredient) async {
    final drinks = await api.fetchDrinksByIngredient(ingredient);

    _drinksController.sink.add(drinks);
  }

  fetchIngredients() async {
    final ingredients = await api.fetchIngridients();

    _ingredientsContriller.sink.add(ingredients);
  }


  dispose() {
    _drinksController.close();
    _ingredientsContriller.close();
  }

}