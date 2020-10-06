import 'package:flutter/material.dart';

import '../models/drink_model.dart';
import '../widgets/drink.dart';

class DrinksListHorizontal extends StatelessWidget {
  final Stream stream;
  final _bottomSpace = 10.0;

  DrinksListHorizontal({@required this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading drinks...');
        }
        return ListView.builder(
          padding: EdgeInsets.only(bottom: _bottomSpace),
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            final drink = DrinkModel.fromJson(snapshot.data[index]);
            return Drink(drink: drink, index: index);
          },
        );
      },
    );
  }
}
