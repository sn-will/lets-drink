import 'package:flutter/material.dart';
import '../models/drink_model.dart';

class DrinkDetail extends StatelessWidget {
  final DrinkModel drink;
  final _imageHeight = 340.0;
  final _contentPadding = 15.0;
  final _textSpacing = 15.0;
  final _titleSize = 28.0;
  final double _tagsSize = 14.0;
  final _descriptionSize = 16.0;
  final double _boxRadius = 20.0;

  DrinkDetail({this.drink});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          drinkHeader(),
          drinkBody(),
        ],
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
      child: Transform.translate(
        offset: Offset(0, -_boxRadius),
        child: Hero(
          tag: '${drink.name}-content',
          child: Container(
            padding: EdgeInsets.all(_contentPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_boxRadius),
                topRight: Radius.circular(_boxRadius),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.all(0.0),
              children: <Widget>[
                drinkName(),
                Divider(),
                drinkDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drinkName() {
    Widget drinkTags() {
      return Text(
        '${drink.tags}',
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: _tagsSize,
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(bottom: _textSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${drink.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: _titleSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: drink.tags.length > 0 ? 5 : 0),
            drink.tags.length > 0 ? drinkTags() : Container(),
          ],
        ),
      ),
    );
  }

  Widget drinkDescription() {
    return Material(
      color: Colors.transparent,
      child: Text(
        '${drink.instructions}',
        style: TextStyle(
          fontSize: _descriptionSize,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
