import 'package:flutter/material.dart';
import '../models/drink_model.dart';

class Drink extends StatelessWidget {
  final DrinkModel drink;
  
  Drink({this.drink});

  @override
  Widget build(BuildContext context) {
    
    return Text('Im a Drink: ${drink.name}');
  }
}