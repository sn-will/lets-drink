class IngredientModel {
  String name;

  IngredientModel.fromJson(parsedJson) {
    name = parsedJson['strIngredient1'];
  }
}