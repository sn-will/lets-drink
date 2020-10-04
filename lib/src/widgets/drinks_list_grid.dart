import 'package:flutter/material.dart';
import '../blocs/drinks_bloc_provider.dart';
import '../models/drink_model.dart';
import '../widgets/drink.dart';

class DrinksListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = DrinksProvider.of(context);
    final double _gridSpacing = 18.0;

    bloc.fetchDrinksByIngredient('Tequila');

    return StreamBuilder(
      stream: bloc.fetchDrinks,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Text('Drinks not loaded');
        }
        return GridView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            final drink = DrinkModel.fromJson(snapshot.data[index]);
            return Drink(drink: drink);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: _gridSpacing,
            crossAxisSpacing: _gridSpacing,
            childAspectRatio: 0.75,
          ),
          padding: EdgeInsets.all(_gridSpacing),
        );
      },
    );
  }
}
