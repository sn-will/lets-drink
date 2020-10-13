import 'package:flutter/material.dart';
import '../models/drink_model.dart';

class Drink extends StatelessWidget {
  final DrinkModel drink;
  final int index;
  final double _contentSpacing = 12.0;
  final double _imageHeight = 100;
  final double _boxRadius = 16.0;
  final double _shadowSize = 6.5;
  final double _drinkMargin = 20.0;

  Drink({@required this.drink, this.index});

  @override
  Widget build(BuildContext context) {
    return drinkContainer(context);
  }

  Widget drinkContainer(context) {
    final isFirst = index == 0;

    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/${drink.id}', arguments: drink),
      child: Container(
        width: 160,
        margin: EdgeInsets.only(
            right: _drinkMargin, left: isFirst ? _drinkMargin : 0),
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
          children: <Widget>[itemImage(), Expanded(child: itemInfo(), flex: 1)],
        ),
      ),
    );
  }

  Widget itemImage() {
    return Hero(
      tag: drink.id,
      child: Container(
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
      ),
    );
  }

  Widget itemInfo() {
    Widget drinkName() {
      return Text(
        '${drink.name}',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
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
          Icon(Icons.star_border, color: Colors.pinkAccent, size: 28.0),
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
