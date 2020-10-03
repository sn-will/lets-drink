import 'package:flutter/material.dart';
import '../blocs/drinks_bloc_provider.dart';
import '../widgets/drinks_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrinksProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lets Drink!'),
        ),
        body: DrinksList(),
      ),
    );
  }
}
