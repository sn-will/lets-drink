class Drink {
  String id;
  String name;
  String category;
  String alcoholic;
  String instructions;
  String image;

  Drink.fromJson(parsedJson) {
    id = parsedJson['idDrink'];
    name = parsedJson['strDrink'];
    category = parsedJson['strCategory'];
    alcoholic = parsedJson['strAlcoholic'];
    instructions = parsedJson['strInstructions'];
    image = parsedJson['strDrinkThumb'];
  }
}