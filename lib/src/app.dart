import 'package:flutter/material.dart';
import 'screens/home.dart';
// import 'package:flutter/rendering.dart';
import 'blocs/drinks_bloc_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;

    return DrinksProvider(
      child: MaterialApp(
        title: 'Lets Drink!',
        home: Home(),
        theme: ThemeData(fontFamily: 'Noto Sans'),
      ),
    );
  }
}
