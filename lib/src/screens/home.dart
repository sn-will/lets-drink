import 'package:flutter/material.dart';
import '../blocs/drinks_bloc_provider.dart';
import '../widgets/drinks_list_grid.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrinksProvider(
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 100.0,
                pinned: true,
                backgroundColor: Colors.orangeAccent,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Let\'s Drink!'),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(15.0),
                sliver: DrinksListGrid(),
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget pageTitle() {
    final _titleSpacing = 18.0;

    return Container(
      padding: EdgeInsets.only(
          top: _titleSpacing, left: _titleSpacing, right: _titleSpacing),
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
