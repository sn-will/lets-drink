import 'package:flutter/material.dart';
import '../models/drink_model.dart';

class DrinkDetail extends StatelessWidget {
  final DrinkModel drink;
  final _imageHeight = 280.0;
  final _contentPadding = 15.0;
  final _textSpacing = 15.0;
  final _titleSize = 28.0;
  final _descriptionSize = 16.0;
  final double _boxRadius = 16.0;

  DrinkDetail({this.drink});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            drinkHeader(),
            drinkBody(),
          ],
        ),
      ),
    );
  }

  Widget drinkHeader() {
    return Hero(
      tag: drink.id,
      child: Container(
        height: _imageHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(drink.image).image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget drinkBody() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(_contentPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_boxRadius),
            topRight: Radius.circular(_boxRadius),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: _textSpacing),
              child: Text(
                '${drink.name}',
                style: TextStyle(
                  fontSize: _titleSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(),
            Text(
              '${drink.instructions}',
              style: TextStyle(
                fontSize: _descriptionSize,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
