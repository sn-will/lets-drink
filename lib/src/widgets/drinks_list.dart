import 'package:flutter/material.dart';
import '../blocs/drinks_bloc_provider.dart';
import '../models/drink_model.dart';
import '../widgets/drink.dart';

class DrinksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = DrinksProvider.of(context);

    bloc.fetchDrinksByIngredient('Gin');

    return StreamBuilder(
      stream: bloc.fetchDrinks,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Text('Drinks not loaded');
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final drink = DrinkModel.fromJson(snapshot.data[index]);
            return Drink(drink: drink);
          },
          itemCount: snapshot.data.length,
        );
      },
    );
  }
}
