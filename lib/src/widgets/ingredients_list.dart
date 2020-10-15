import 'package:flutter/material.dart';
import '../blocs/drinks_bloc_provider.dart';
import '../models/ingredient_model.dart';

class IngredientsList extends StatefulWidget {
  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  final _tagRadius = 16.0;
  final _tagPadding = 15.0;
  final _tagSpacing = 10.0;
  int selectedItemIndex;

  selectIngredient(index, bloc, ingrident) {
    setState(() {
      selectedItemIndex = index;
      bloc.fetchDrinksByIngredient(ingrident.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = DrinksProvider.of(context);

    return StreamBuilder(
      stream: bloc.ingredients,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Ingredients not loaded');
        }
        return Container(
          height: 40.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              final ingredient = IngredientModel.fromJson(snapshot.data[index]);
              return ingredientTag(ingredient, index, bloc);
            },
          ),
        );
      },
    );
  }

  Widget ingredientTag(IngredientModel ingredient, int index, bloc) {
    var isSelected = selectedItemIndex == index;
    var isFirst = index == 0;

    return GestureDetector(
      onTap: () => selectIngredient(index, bloc, ingredient),
      child: Container(
        padding: EdgeInsets.only(left: _tagPadding, right: _tagPadding),
        margin: EdgeInsets.only(right: _tagSpacing, left: isFirst ? (_tagSpacing * 2) : 0.0),
        child: Center(
            child: Text(
          '${ingredient.name}',
          style: TextStyle(color: isSelected ? Colors.white : Colors.black87),
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(_tagRadius),
          ),
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey[300],
        ),
      ),
    );
  }
}
