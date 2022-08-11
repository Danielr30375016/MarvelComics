import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel/login/ui/principal.dart';
import '../main.dart';

class AppRouter{

  Route onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case '/login':
        return MaterialPageRoute(builder: (_) => MyApp());
        break;
      case '/principal':
        return MaterialPageRoute(builder: (_) => Principal());
        break;
      default:
        return null;
    }
  }
}
