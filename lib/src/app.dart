import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/drink_detail.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'blocs/drinks_bloc_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    );

    return DrinksProvider(
      child: MaterialApp(
        title: 'Lets Drink!',
        onGenerateRoute: routes,
        theme: ThemeData(
          primaryColor: Colors.pinkAccent,
          accentColor: Colors.grey[850],
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.grey[850],
            ),
            bodyText1: TextStyle(
              color: Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          final bloc = DrinksProvider.of(context);
          bloc.fetchPopularDrinks();
          bloc.fetchIngredients();

          return Home();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          final drink = settings.arguments;

          return DrinkDetail(drink: drink);
        },
      );
    }
  }
}
