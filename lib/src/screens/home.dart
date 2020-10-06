import 'package:flutter/material.dart';
import '../widgets/ingredients_list.dart';
import '../widgets/drinks_list_horizontal.dart';
import '../blocs/drinks_bloc_provider.dart';


class Home extends StatelessWidget {
  final _contentSpacing = 18.0;

  @override
  Widget build(BuildContext context) {
    final bloc = DrinksProvider.of(context);
    bloc.fetchPopularDrinks();
    bloc.fetchDrinksByIngredient('Tequila');

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            pageTitle('Let\'s Drink!', 'Search for your favorite drinks recipes.'),
            IngredientsList(),
            Expanded(child: popularDrinks(bloc), flex: 2),
            Expanded(child: tequilaDrinks(bloc), flex: 2),
          ],
        ),
      ),
    );
  }

  Widget popularDrinks(bloc) {
    return Column(children: <Widget>[
      pageTitle('Popular Drinks', 'Really awesome list'),
      Expanded(
        flex: 1,
        child: DrinksListHorizontal(stream: bloc.popular),
      )
    ]);
  }

    Widget tequilaDrinks(bloc) {
    return Column(children: <Widget>[
      pageTitle('Tequila', 'See some tequila drinks'),
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(bottom: _contentSpacing),
          child: DrinksListHorizontal(stream: bloc.drinks),
        ),
      )
    ]);
  }

  Widget pageTitle(String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(_contentSpacing),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
