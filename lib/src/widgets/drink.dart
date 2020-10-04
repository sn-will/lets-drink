import 'package:flutter/material.dart';
import '../models/drink_model.dart';

class Drink extends StatelessWidget {
  final DrinkModel drink;
  final double _contentSpacing = 12.0;
  final double _imageHeight = 110;
  final double _boxRadius = 16.0;
  final double _shadowSize = 6.5;

  Drink({this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_boxRadius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: _shadowSize,
            spreadRadius: _shadowSize,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          itemImage(),
          Expanded(child: itemContent(), flex: 1)
        ],
      ),
    );
  }

  Widget itemImage() {
    return Container(
      height: _imageHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(drink.image).image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_boxRadius),
          topRight: Radius.circular(_boxRadius),
        ),
      ),
    );
  }

  Widget itemContent() {
    Widget drinkName() {
      return Text(
        '${drink.name}',
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    Widget drinkBottom() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.star, color: Colors.orangeAccent, size: 28.0),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.all(_contentSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: drinkName(), flex: 1),
          drinkBottom(),
        ],
      ),
    );
  }
}
