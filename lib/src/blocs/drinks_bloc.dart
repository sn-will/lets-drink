import '../resources/drinks_api_provider.dart';
import 'package:rxdart/rxdart.dart';

class DrinksBloc {
  final api = DrinksApiProvider();
  final _drinksController = PublishSubject<List<Map<String, dynamic>>>();

  // Getter
  Stream get fetchDrinks => _drinksController.stream;

  fetchDrinksByIngredient(ingredient) async {
    final drinks = await api.fetchDrinkByIngredient(ingredient);

    print(drinks);

    _drinksController.sink.add(drinks);
  }

  dispose() {
    _drinksController.close();
  }

}