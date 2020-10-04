import 'package:flutter/material.dart';
import '../blocs/drinks_bloc_provider.dart';
import '../widgets/drinks_list_grid.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrinksProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lets Drink!'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: DrinksListGrid(),
      ),
    );
  }
}
