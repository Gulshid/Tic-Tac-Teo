import 'package:flutter/material.dart';
import 'package:tac_tic_teo/Routes/RoutesName.dart';
import 'package:tac_tic_teo/view_/game_view_Screen.dart';

class Routes {
  // ignore: non_constant_identifier_names
  static Route<dynamic> generate_Route(RouteSettings helloWorld)
  {
    switch(helloWorld.name)
    {
      case Routesname.game:
      {
        return MaterialPageRoute(builder: (BuildContext context)=>GameViewScreen());
      }

    default:
      {
        return MaterialPageRoute(builder: (_)=>Scaffold(body: Center(child: Text('There is NO route'),),));
      }
    }
  }
  
}