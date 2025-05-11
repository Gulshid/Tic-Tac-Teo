import 'package:flutter/material.dart';
import 'package:tac_tic_teo/Routes/RoutesName.dart';
import 'package:tac_tic_teo/view_/Game_view.dart';

class Routes {
  static Route<dynamic> generate_Route(RouteSettings game) {
    switch (game..name) {
      // ignore: constant_pattern_never_matches_value_type
      case Routesname.game_screen:
        {
          return MaterialPageRoute(
            builder: (BuildContext context) =>Game_Screen(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  body: Center(child: Text('There is no such route')),
                ),
          );
        }
    }
  }
}
