class Ingredient {
  String ingredient;

  Ingredient.fromJson(parsedJson) {
    ingredient = parsedJson['strIngredient1'];
  }
}