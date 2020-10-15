import 'package:flutter/material.dart';
import '../widgets/ingredients_list.dart';
import '../widgets/drinks_list_horizontal.dart';
import '../widgets/content_title.dart';
import '../widgets/bottom_navigation.dart';
import '../blocs/drinks_bloc_provider.dart';

class Home extends StatelessWidget {
  final _contentTitleSize = 20.0;

  @override
  Widget build(BuildContext context) {
    final bloc = DrinksProvider.of(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(padding: EdgeInsets.only(top: 20)),
            ContentTitle(
              title: 'Let\'s Drink!',
              titleSize: 34,
              titleColor: Theme.of(context).primaryColor,
              titleWeight: FontWeight.w700,
              subtitle: 'Your favorite drinks recipes are here!',
              subtitleSize: 20.0,
            ),
            Expanded(child: popularDrinks(bloc), flex: 3),
            Expanded(child: listIngridients(bloc), flex: 2),
          ],
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }

  Widget popularDrinks(bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ContentTitle(
        title: 'Popular drinks',
        titleSize: _contentTitleSize,
      ),
        Expanded(
          flex: 1,
          child: DrinksListHorizontal(stream: bloc.popular),
        )
      ],
    );
  }

  Widget listIngridients(bloc) {
    return Column(children: <Widget>[
      ContentTitle(
        title: 'Got the ingredients?',
        titleSize: _contentTitleSize,
        subtitle: 'Find out what you can do',
        subtitleSize: 14,
      ),
      IngredientsList(),
    ]);
  }
}
