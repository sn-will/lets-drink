import 'package:flutter/material.dart';
import '../widgets/ingredients_list.dart';

class Home extends StatelessWidget {
  final _contentSpacing = 18.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            pageTitle(),
            Container(
              margin: EdgeInsets.only(left: _contentSpacing, top: _contentSpacing, bottom: _contentSpacing),
              child: IngredientsList(),
            ),
            Expanded(child: Container(color: Colors.blue), flex: 2),
            Expanded(child: Container(color: Colors.deepPurple), flex: 2),
          ],
        ),
      ),
    );
  }

  Widget pageTitle() {
    return Container(
      padding: EdgeInsets.only(
          top: _contentSpacing, left: _contentSpacing, right: _contentSpacing),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Let\'s Drink!',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          ),
          Text(
            'Search for your favorite drinks recipes.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
