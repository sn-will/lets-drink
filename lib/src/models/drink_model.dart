class DrinkModel {
  String id;
  String name;
  String category;
  String alcoholic;
  String instructions;
  String image;

  DrinkModel.fromJson(parsedJson) {
    id = parsedJson['idDrink'];
    name = parsedJson['strDrink'];
    image = parsedJson['strDrinkThumb'];
    category = parsedJson['strCategory'] ?? '';
    alcoholic = parsedJson['strAlcoholic'] ?? '';
    instructions = parsedJson['strInstructions'] ?? '';
  }
}