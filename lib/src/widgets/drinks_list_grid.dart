import 'package:flutter/material.dart';
import '../blocs/drinks_bloc_provider.dart';
import '../models/drink_model.dart';
import '../widgets/drink.dart';

class DrinksListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = DrinksProvider.of(context);
    final double _gridSpacing = 15.0;
    final size = MediaQuery.of(context).size;
    final drinkHeight = (size.height - 80) / 3;
    final drinkWidth = size.width / 2;

    bloc.fetchDrinksByIngredient('Bourbon');

    return StreamBuilder(
        stream: bloc.drinks,
        builder: (context, AsyncSnapshot snapshot) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (!snapshot.hasData) {
                  return Text('Not loaded!');
                }
                final drink = DrinkModel.fromJson(snapshot.data[index]);
                return Drink(drink: drink);
              },
              childCount: snapshot.hasData ? snapshot.data.length : 0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: _gridSpacing,
              crossAxisSpacing: _gridSpacing,
              childAspectRatio: (drinkWidth / drinkHeight),
            ),
          );
        });
  }
}
