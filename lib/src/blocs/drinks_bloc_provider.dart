import 'package:flutter/material.dart';
import 'drinks_bloc.dart';
export 'drinks_bloc.dart';


class DrinksProvider extends InheritedWidget {
  final DrinksBloc bloc;

  DrinksProvider({ Key key, Widget child })
    : bloc = DrinksBloc(),
      super(key: key, child: child);

  
  bool updateShouldNotify(_) => true;

  static DrinksBloc of (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(DrinksProvider) as DrinksProvider).bloc;
  }
}