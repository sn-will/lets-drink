import 'package:flutter/material.dart';
import '../widgets/ingredients_list.dart';
import '../widgets/drinks_list_horizontal.dart';
import '../blocs/drinks_bloc_provider.dart';


class Home extends StatelessWidget {
  final _contentSpacing = 18.0;

  @override
  Widget build(BuildContext context) {
    final bloc = DrinksProvider.of(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(padding: EdgeInsets.only(top: 20)),
            contentTitle('Let\'s Drink!', 'Search for your favorite drinks recipes.', 32),
            Expanded(child: popularDrinks(bloc), flex: 2),
            Expanded(child: tequilaDrinks(bloc), flex: 2),
          ],
        ),
      ),
    );
  }

  Widget popularDrinks(bloc) {
    return Column(children: <Widget>[
      contentTitle('Popular Drinks', 'Really awesome list', 18),
      Expanded(
        flex: 1,
        child: DrinksListHorizontal(stream: bloc.popular),
      )
    ]);
  }

    Widget tequilaDrinks(bloc) {
    return Column(children: <Widget>[
      contentTitle('Tequila', 'See some tequila drinks', 18),
      IngredientsList(),
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(bottom: _contentSpacing),
          child: DrinksListHorizontal(stream: bloc.drinks),
        ),
      )
    ]);
  }

  Widget contentTitle(String title, String subtitle, double titleSize) {
    return Container(
      padding: EdgeInsets.only(top: (_contentSpacing / 2), bottom: (_contentSpacing / 2), left: _contentSpacing, right: _contentSpacing),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w700),
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
